//
//  CVEducationViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVEducationViewController.h"

#import "CVPreviewItem.h"

@interface CVEducationViewController () <QLPreviewControllerDataSource>

@property (nonatomic, strong) CVPreviewItem *previewItem;

@end

@implementation CVEducationViewController

@synthesize pageIndex = _pageIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getters & Setters

- (CVPreviewItem *)previewItem
{
    if (self->_previewItem == nil)
    {
        NSURL *localURL = [[NSBundle mainBundle] URLForResource:@"Record" withExtension:@"pdf"];
        self->_previewItem = [[CVPreviewItem alloc] initWithTitle:@"Academic Record" andPreviewURL:localURL];
    }
    
    return self->_previewItem;
}

#pragma mark - Actions

- (IBAction)academicTranscriptAction:(id)sender
{
    if ([QLPreviewController canPreviewItem:self.previewItem])
    {
        QLPreviewController *previewController = [[QLPreviewController alloc] init];
        previewController.dataSource = self;
        [self.navigationController pushViewController:previewController animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }

}

#pragma mark - Quick Look

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;
{
    return self.previewItem;
}

@end
