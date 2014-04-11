//
//  CVHomeViewController.m
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

#import "CVHomeViewController.h"

#import "CVPageViewController.h"

#import "CVProfileView.h"

/// Set the identifiers of the view controllers to the class name
/// so that more stuff can be done with them.
static NSString *CVTimelineViewControllerIdentifier = @"CVTimelineTableViewController";
static NSString *CVExtraCurricularViewControllerIdentifier = @"CVExtraCurricularTableViewController";
static NSString *CVEducationViewControllerIdentifier = @"CVEducationViewController";
static NSString *CVReferencesViewControllerIdentifier = @"CVReferencesCollectionViewController";
static NSString *CVTimelineSplitViewControllerIdentifier = @"CVTimelineSplitViewController";
static NSString *CVExtraCurricularSplitViewControllerIdentifier = @"CVExtraCurricularSplitViewController";

@interface CVHomeViewController () <CVProfileViewDelegate, UIPageViewControllerDelegate>

@property (nonatomic, weak) IBOutlet CVProfileView *profileView;
@property (nonatomic, weak) IBOutlet UIView *pagesView;

@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *profileViewHeightLayoutConstraint;

@property (nonatomic, strong) NSArray *pageContentViewControllerIdentifiers;

@property (nonatomic, strong) NSString *descriptionTextBeforeInfoTransition;

@end

@implementation CVHomeViewController

- (void)loadView
{
    [super loadView];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.profileView.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getters & Setters

- (NSArray *)pageContentViewControllerIdentifiers
{
    if (self->_pageContentViewControllerIdentifiers == nil) {
        
        NSArray *identifiers = nil;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            identifiers = @[CVTimelineSplitViewControllerIdentifier,
                            CVExtraCurricularSplitViewControllerIdentifier,
                            CVEducationViewControllerIdentifier,
                            CVReferencesViewControllerIdentifier];
        }
        else
        {
            identifiers = @[CVTimelineViewControllerIdentifier,
                            CVExtraCurricularViewControllerIdentifier,
                            CVEducationViewControllerIdentifier,
                            CVReferencesViewControllerIdentifier];
        }

        self->_pageContentViewControllerIdentifiers = identifiers;
        
        self.pageControl.numberOfPages = [identifiers count];
    }
    
    return self->_pageContentViewControllerIdentifiers;
}

#pragma mark - Logic

- (void)refreshFromPageViewController:(UIPageViewController *)pageViewController
{
    // In our case we only ever load one.
    UIViewController *currentController = [pageViewController.viewControllers lastObject];
    NSString *controllerIdentifier = NSStringFromClass([currentController class]);
    
    self.profileView.descriptionLabel.text = currentController.title;
    
    self.pageControl.currentPage = [self.pageContentViewControllerIdentifiers indexOfObject:controllerIdentifier];
}

- (void)layoutSubviews:(BOOL)animated
            completion:(void(^)(BOOL finished))completionBlock
{
    if (animated)
    {
        [UIView animateWithDuration:0.6
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.profileView layoutIfNeeded];
                             [self.pagesView layoutIfNeeded];
                         } completion:completionBlock];
    } else {
        [self.profileView layoutIfNeeded];
        [self.pagesView layoutIfNeeded];
        
        if (completionBlock)
        {
            completionBlock(YES);
        }
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Page Segue"])
    {
        CVPageViewController *pageViewController = [segue destinationViewController];
        pageViewController.delegate = self;
        pageViewController.viewControllerIdentifiers = self.pageContentViewControllerIdentifiers;
        
        [self refreshFromPageViewController:pageViewController];
    }
}

#pragma mark - Profile View

- (void)profileViewDidSelectInfoButton:(CVProfileView *)profileView
{
    self.profileViewHeightLayoutConstraint.constant = self.view.frame.size.height;
    
    [self.pageControl setHidden:YES animated:YES];
    
    [self layoutSubviews:YES completion:nil];
    
    self.descriptionTextBeforeInfoTransition = self.profileView.descriptionLabel.text;
    self.profileView.descriptionLabel.text = @"About Me";
}

- (void)profileViewDidSelectCloseButton:(CVProfileView *)profileView
{
    CGFloat profileViewHeight = self.profileView.length;
    
    self.profileViewHeightLayoutConstraint.constant = profileViewHeight;

    [self.pageControl setHidden:NO animated:YES];
    
    [self layoutSubviews:YES completion:^(BOOL finished) {
        self.profileView.descriptionLabel.text = self.descriptionTextBeforeInfoTransition;
        self.descriptionTextBeforeInfoTransition = nil;
    }];
}

#pragma mark - Page Control

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    if (completed)
    {
        [self refreshFromPageViewController:pageViewController];
    }
}

@end
