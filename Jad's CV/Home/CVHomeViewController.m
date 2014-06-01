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

/// Storyboard identifier for CVTimelineNavigationController.
static NSString *CVTimelineViewControllerIdentifier = @"CVTimelineNavigationController";
/// Storyboard identifier for CVExtraCurricularNavigationController.
static NSString *CVExtraCurricularViewControllerIdentifier = @"CVExtraCurricularNavigationController";
/// Storyboard identifier for CVEducationViewController.
static NSString *CVEducationViewControllerIdentifier = @"CVEducationViewController";
/// Storyboard identifier for CVReferencesCollectionViewController.
static NSString *CVReferencesViewControllerIdentifier = @"CVReferencesCollectionViewController";
/// Storyboard identifier for CVTimelineSplitViewController.
static NSString *CVTimelineSplitViewControllerIdentifier = @"CVTimelineSplitViewController";
/// Storyboard identifier for CVExtraCurricularSplitViewController.
static NSString *CVExtraCurricularSplitViewControllerIdentifier = @"CVExtraCurricularSplitViewController";

@interface CVHomeViewController () <CVProfileViewDelegate, CVProfileViewDataSource, UIPageViewControllerDelegate>

/// The constraint for the height of the profile view. Changing its constant
/// value changes the height of the pagesView.
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *profileViewHeightLayoutConstraint;

/// The profile view
@property (nonatomic, weak) IBOutlet CVProfileView *profileView;
/// Container view which handles displaying the views for each page.
@property (nonatomic, weak) IBOutlet UIView *pagesView;

/// A visual indicator to show what page is currently displayed.
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

/// An array to store the storyboard identifiers for the view controllers
/// to be paged.
/// NOTE: they are different for iPad and iPhone.
@property (nonatomic, strong) NSArray *pageContentViewControllerIdentifiers;

/// Property to remember the last description text before the profile view
/// is extended via the profileViewHeightLayoutConstraint.
@property (nonatomic, strong) NSString *descriptionTextBeforeInfoTransition;

@end

@implementation CVHomeViewController

- (void)loadView
{
    [super loadView];

    CVProfileView *profileView = self.profileView;
    profileView.delegate = self;
    profileView.dataSource = self;
    profileView.personalInfo = [CVPersonalInfo personalInfo];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.profileView handleBackgroundImageBlur:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.profileView.expanded)
    {
        return UIStatusBarStyleDefault;
    }

    return UIStatusBarStyleLightContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

#pragma mark - Getters & Setters

- (NSArray *)pageContentViewControllerIdentifiers
{
    if (self->_pageContentViewControllerIdentifiers == nil) {
        // Set the identifiers for the decive.
        NSArray *identifiers = nil;
        if (IPAD())
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
        
        // Indicate the number of pages to display in the page control.
        self.pageControl.numberOfPages = [identifiers count];
    }
    
    return self->_pageContentViewControllerIdentifiers;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Page Segue"])
    {
        // Set the page view controller's properties.
        CVPageViewController *pageViewController = [segue destinationViewController];
        pageViewController.delegate = self;
        pageViewController.viewControllerIdentifiers = self.pageContentViewControllerIdentifiers;
        // Refresh the UI.
        [self refreshFromPageViewController:pageViewController];
    }
}

#pragma mark - Logic

/**
 *  Refreshes the description label in the profile view and the page
 *  control indicator.
 *
 *  @param pageViewController The page view controller who's page has changed.
 */
- (void)refreshFromPageViewController:(UIPageViewController *)pageViewController
{
    // In our case we only ever load one page thus this array will only
    // ever contain one element.
    UIViewController *currentController = [pageViewController.viewControllers lastObject];
    NSString *controllerIdentifier = NSStringFromClass([currentController class]);
    
    self.profileView.descriptionLabel.text = currentController.title;
    
    // Because we store the storyboard identifiers as the class names
    // we can extract the index from the identifiers array.
    self.pageControl.currentPage = [self.pageContentViewControllerIdentifiers indexOfObject:controllerIdentifier];
}

/**
 *  Layout the profile's and pages view's subviews.
 *
 *  @param animated        Flag to set wether to animate the changes.
 *  @param completionBlock Called when the layout has completed.
 */
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

#pragma mark - Profile View

- (void)profileViewDidSelectInfoButton:(CVProfileView *)profileView
{
    // Set the profile view height to the full height of the view.
    self.profileViewHeightLayoutConstraint.constant = self.view.frame.size.height;
    
    // Save the current description label text.
    self.descriptionTextBeforeInfoTransition = self.profileView.descriptionLabel.text;
    // Update the description label text.
    self.profileView.descriptionLabel.text = self.profileView.personalInfo.location;

    // Set the UI changes.
    BOOL animated = YES;
    [self.pageControl setHidden:YES animated:animated];
    [self setNeedsStatusBarAppearanceUpdate:animated];
    [self layoutSubviews:animated completion:nil];
    [self.profileView handleBackgroundImageBlur:NO];
}

- (void)profileViewDidSelectCloseButton:(CVProfileView *)profileView
{
    // Set the profile view's height back to it layout length.
    self.profileViewHeightLayoutConstraint.constant = self.profileView.length;

    // Set the UI changes.
    BOOL animated = YES;
    [self.pageControl setHidden:NO animated:animated];
    [self setNeedsStatusBarAppearanceUpdate:animated];
    [self layoutSubviews:animated completion:^(BOOL finished) {
        [self.profileView handleBackgroundImageBlur:animated];
        // Reset the description label text back to what it was.
        self.profileView.descriptionLabel.text = self.descriptionTextBeforeInfoTransition;
        // Remove the stored text.
        self.descriptionTextBeforeInfoTransition = nil;
    }];
}

- (UIViewController *)controllerForEmailPresentationInProfileView:(CVProfileView *)profileView
{
    return self;
}

#pragma mark - Page Control

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    [[NSNotificationCenter defaultCenter] postNotificationName:CVPagingNotification object:self userInfo:@{CVPagingStateKey: @(CVPagingStateBeganScroll), CVPagingControllersKey: pendingViewControllers}];
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    // Only refresh the UI if the transition was completed.
    if (completed)
    {
        [self refreshFromPageViewController:pageViewController];
    }
    
    if (finished)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:CVPagingNotification object:self userInfo:@{CVPagingStateKey: @(CVPagingStateFinishedScroll), CVPagingControllersKey: previousViewControllers}];
    }
}

@end
