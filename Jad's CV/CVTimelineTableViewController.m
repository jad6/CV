//
//  CVTimelineTableViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTimelineTableViewController.h"

#import "CVTimelineEventTableViewCell.h"

static NSString *CVMajorEventTableCellIdentifier = @"Major Event Cell";
static NSString *CVMinorEventTableCellIdentifier = @"Minor Event Cell";

@interface CVTimelineTableViewController ()

@end

@implementation CVTimelineTableViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Experience";
    
    NSString *eventsFilePath = [[NSBundle mainBundle] pathForResource:@"Experience" ofType:@"plist"];
    NSArray *events = [CVTimelineEvent extraObjectsFromFilePath:eventsFilePath];
    [self setData:events containsSections:NO];
}

#pragma mark - Table View

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    CVTimelineEvent *event = [self objectAtIndexPath:indexPath];
    
    NSString *CellIdentifier = [super cellIdentifierForIndexPath:indexPath];
    if (event.importance == CVTimelineEventImportanceMajor)
    {
        CellIdentifier = CVMajorEventTableCellIdentifier;
    }
    else if (event.importance == CVTimelineEventImportanceMinor)
    {
        CellIdentifier = CVMinorEventTableCellIdentifier;
    }
    
    return CellIdentifier;
}

- (void)tableView:(UITableView *)tableView
    configureCell:(CVTimelineEventTableViewCell *)cell
       withObject:(CVTimelineEvent *)event
      atIndexPath:(NSIndexPath *)indexPath
{
    cell.event = event;
}

- (void)tableView:(UITableView *)tableView
  didSelectObject:(CVTimelineEvent *)event
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
