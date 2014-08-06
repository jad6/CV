//
//  CVExtraCurricularTableViewController.m
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

#import "CVExtraCurricularTableViewController.h"

#import "CVDetailViewController.h"

#import "CVExtraCurricularTableViewCell.h"

static NSString *CVExtraCurricularTableCellIdentifier = @"Extra Curricular Cell";

@interface CVExtraCurricularTableViewController ()

@end

@implementation CVExtraCurricularTableViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSLocalizedString(@"ExtraCurricularTitle", nil);

    self.clearsSelectionOnViewWillAppear = !IS_IPAD;

    NSArray *activities = [CVExtraCurricularActivity extraCurricularActivities];
    [self setData:activities containsSections:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (IS_IPAD) {
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self tableView:self.tableView didSelectRowAtIndexPath:firstIndexPath];
        [self.tableView selectRowAtIndexPath:firstIndexPath animated:animated scrollPosition:UITableViewScrollPositionTop];
    }
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:CVDetailSegueIdentifier]
        && IS_IPHONE) {
        CVDetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        detailViewController.experience = [self objectAtIndexPath:selectedIndexPath];
    }
}

#pragma mark - Table View

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath {
    return CVExtraCurricularTableCellIdentifier;
}

- (void) listView:(id)listView
    configureCell:(CVExtraCurricularTableViewCell *)cell
       withObject:(CVExtraCurricularActivity *)activity
      atIndexPath:(NSIndexPath *)indexPath {
    cell.activity = activity;
}

- (void)   listView:(id)listView
    didSelectObject:(CVExtraCurricularActivity *)activity
        atIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(extraCurricularViewController:didSelectExperience:)]) {
        [self.delegate extraCurricularViewController:self
                                 didSelectExperience:activity];
    }
}

@end
