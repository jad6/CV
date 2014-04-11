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
