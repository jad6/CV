//
//  CVHomeViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVHomeViewController.h"

#import "CVPageViewController.h"

static NSString *CVTimelineViewControllerIdentifier = @"CVTimelineTableViewController";
static NSString *CVExtraCurricularViewControllerIdentifier = @"CVExtraCurricularTableViewController";
static NSString *CVEducationViewControllerIdentifier = @"CVEducationViewController";
static NSString *CVReferencesViewControllerIdentifier = @"CVReferencesTableViewController";

@interface CVHomeViewController ()

@end

@implementation CVHomeViewController

- (void)loadView
{
    [super loadView];
    
    [self.navigationController setNavigationBarHidden:YES];
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

#pragma mark - Logic

- (NSArray *)pageContentViewControllerIdentifiers
{
    return @[CVTimelineViewControllerIdentifier,
             CVExtraCurricularViewControllerIdentifier,
             CVEducationViewControllerIdentifier,
             CVReferencesViewControllerIdentifier];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Page Segue"])
    {
        CVPageViewController *pageViewController = [segue destinationViewController];
        pageViewController.viewControllerIdentifiers = [self pageContentViewControllerIdentifiers];
    }
}

@end
