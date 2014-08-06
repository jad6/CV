//
//  CVTutorialViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 6/08/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTutorialViewController.h"

#import "CVTutorialSwipeView.h"

@interface CVTutorialViewController ()

@property (nonatomic, strong) IBOutlet CVTutorialSwipeView *swipeView;

@end

@implementation CVTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.swipeView.backgroundColor = [UIColor blackColor];

    [self.swipeView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
