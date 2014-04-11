//
//  CVExtraCurricularTableViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVExtraCurricularTableViewController.h"

#import "CVExtraCurricularTableViewCell.h"

static NSString *CVExtraCurricularTableCellIdentifier = @"Extra Curricular Cell";

@interface CVExtraCurricularTableViewController ()

@end

@implementation CVExtraCurricularTableViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Extra Curricular";
    
    NSString *activitiesFilePath = [[NSBundle mainBundle] pathForResource:@"Extra Curricular" ofType:@"plist"];
    NSArray *activities = [CVExtraCurricularActivity extraCurricularActivitiesFromFileContents:activitiesFilePath];
    [self setData:activities containsSections:YES];
}

#pragma mark - Table View

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    return CVExtraCurricularTableCellIdentifier;
}

- (void)tableView:(UITableView *)tableView
    configureCell:(CVExtraCurricularTableViewCell *)cell
       withObject:(CVExtraCurricularActivity *)activity
      atIndexPath:(NSIndexPath *)indexPath
{
    cell.activity = activity;
}

- (void)tableView:(UITableView *)tableView
  didSelectObject:(CVExtraCurricularActivity *)activity
      atIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
