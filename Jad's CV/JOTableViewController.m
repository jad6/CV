//
//  JOTableViewController.m
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

#import "JOTableViewController.h"

static NSString *CVTableDefaultCellIdentifier = @"Cell";

@interface JOTableViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation JOTableViewController

#pragma mark - Logic

- (void)setData:(NSArray *)data containsSections:(BOOL)containsSections
{
    if (self->_data != data)
    {
        // If the data is not formatted for multiple sections then assume
        // that is for a singular section and format it accordingly.
        self->_data = (containsSections) ? data : @[data];
    }
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return self.data[indexPath.section][indexPath.row];
}

- (void)tableView:(UITableView *)tableView configureCell:(id)cell withObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath
{
    return CVTableDefaultCellIdentifier;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get identifers from overridable method.
    NSString *CellIdentifier = [self cellIdentifierForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get object from overridable method.
    id object = [self objectAtIndexPath:indexPath];
    // Configure the cell from overridable method.
    [self tableView:tableView configureCell:cell withObject:object atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get object from overridable method.
    id object = [self objectAtIndexPath:indexPath];
    // Call overridable method.
    [self tableView:tableView didSelectObject:object atIndexPath:indexPath];
}

@end
