//
//  CVTimelineSplitViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 11/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTimelineSplitViewController.h"

#import "CVTimelineTableViewController.h"

@interface CVTimelineSplitViewController ()

@end

@implementation CVTimelineSplitViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Experience";
}

@end
