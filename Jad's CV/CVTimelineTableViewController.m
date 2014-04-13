//
//  CVTimelineTableViewController.m
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

#import "CVTimelineTableViewController.h"

#import "CVDetailViewController.h"

#import "CVTimelineEventTableViewCell.h"

/// Cell identifier for major events.
static NSString *CVMajorEventTableCellIdentifier = @"Major Event Cell";
/// Cell identifier for minor events.
static NSString *CVMinorEventTableCellIdentifier = @"Minor Event Cell";

@implementation CVTimelineTableViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Experience";
    
    self.clearsSelectionOnViewWillAppear = IPHONE();
    
    NSArray *events = [CVTimelineEvent timetableEvents];
    [self setData:events containsSections:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (IPAD())
    {
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self tableView:self.tableView didSelectRowAtIndexPath:firstIndexPath];
        [self.tableView selectRowAtIndexPath:firstIndexPath animated:animated scrollPosition:UITableViewScrollPositionTop];
    }
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:CVDetailSegueIdentifier]
        && IPHONE())
    {
        CVDetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        detailViewController.experience = [self objectAtIndexPath:selectedIndexPath];
    }
}

#pragma mark - Table View

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    CVTimelineEvent *event = [self objectAtIndexPath:indexPath];
    NSString *CellIdentifier = [super cellIdentifierForIndexPath:indexPath];
    
    // Set the appropriate cell identifier base on importance of the event.
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

- (void)listView:(id)listView
   configureCell:(CVTimelineEventTableViewCell *)cell
      withObject:(CVTimelineEvent *)event
     atIndexPath:(NSIndexPath *)indexPath
{
    cell.event = event;
}

- (void)listView:(id)listView
 didSelectObject:(id)object
     atIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(timelineViewController:didSelectExperience:)])
    {
        [self.delegate timelineViewController:self
                        didSelectExperience:object];
    }
}

@end
