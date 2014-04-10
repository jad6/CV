//
//  CVPageViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVPageViewController.h"

#import "CVPageContentViewController.h"

@interface CVPageViewController () <UIPageViewControllerDataSource>

@end

@implementation CVPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = self;
}

- (void)setViewControllerIdentifiers:(NSArray *)viewControllerIdentifiers
{
    if (self->_viewControllerIdentifiers != viewControllerIdentifiers)
    {
        self->_viewControllerIdentifiers = viewControllerIdentifiers;
        
        UIViewController *startingViewController = [self viewControllerWithIdentifier:[self->_viewControllerIdentifiers firstObject]];
        [self setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
}

#pragma mark - Logic

- (UIViewController *)viewControllerWithIdentifier:(NSString *)identifier
{
    return [self.storyboard instantiateViewControllerWithIdentifier:identifier];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    NSArray *viewControllerIdentifiers = self.viewControllerIdentifiers;
    
    NSUInteger numControllers = [viewControllerIdentifiers count];
    if ((numControllers == 0) || (index >= numControllers))
    {
        return nil;
    }
    
    NSString *identifier = viewControllerIdentifiers[index];
    
    UIViewController<CVPageContentViewController> *viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    viewController.pageIndex = index;
    
    return viewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController<CVPageContentViewController> *)viewController
{
    NSUInteger index = viewController.pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController<CVPageContentViewController> *)viewController
{
    NSUInteger index = viewController.pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    
    if (index == [self.viewControllerIdentifiers count])
    {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

@end
