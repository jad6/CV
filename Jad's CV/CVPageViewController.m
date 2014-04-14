//
//  CVPageViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer. Redistributions in binary
//  form must reproduce the above copyright notice, this list of conditions and
//  the following disclaimer in the documentation and/or other materials
//  provided with the distribution. Neither the name of the nor the names of
//  its contributors may be used to endorse or promote products derived from
//  this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

#import "CVPageViewController.h"

#import "CVPageContentViewController.h"

@interface CVPageViewController () <UIPageViewControllerDataSource>

@end

@implementation CVPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor backgroundGrayColor];
    self.dataSource = self;
}

- (void)setViewControllerIdentifiers:(NSArray *)viewControllerIdentifiers
{
    if (self->_viewControllerIdentifiers != viewControllerIdentifiers)
    {
        self->_viewControllerIdentifiers = viewControllerIdentifiers;
        
        if ([viewControllerIdentifiers count] > 0)
        {
            // Create the initial view contorller from the given controller identifiers.
            UIViewController *startingViewController = [self viewControllerWithIdentifier:[self->_viewControllerIdentifiers firstObject]];
            startingViewController.view.frame = self.view.frame;
            // Add it the the page controller.
            [self setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        }
    }
}

#pragma mark - Logic

/**
 *  Helper method to instantiate a storyboard view controller from its identifier.
 *
 *  @param identifier The identifier of the view controller to instantiate.
 *
 *  @return The instantiated view controller.
 */
- (UIViewController *)viewControllerWithIdentifier:(NSString *)identifier
{
    return [self.storyboard instantiateViewControllerWithIdentifier:identifier];
}

/**
 *  Helper method to return the view controller for a given page controller 
 *  index.
 *
 *  @param index The index of the view controller to return.
 *
 *  @return The view controller at the given index.
 */
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    NSArray *viewControllerIdentifiers = self.viewControllerIdentifiers;
    
    // If the number of identifiers is invalid return nil.
    NSUInteger numIdentifiers = [viewControllerIdentifiers count];
    if ((numIdentifiers == 0) || (index >= numIdentifiers))
    {
        return nil;
    }
    
    NSString *identifier = viewControllerIdentifiers[index];
    
    // Instantiate the view controller and set its page index.
    UIViewController<CVPageContentViewController> *viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    viewController.pageIndex = index;
    viewController.view.frame = self.view.frame;
    
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
