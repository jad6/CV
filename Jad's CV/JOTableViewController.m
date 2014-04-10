//
//  JOTableViewController.m
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "JOTableViewController.h"

static NSString *CVTableDefaultCellIdentifier = @"Cell";

@interface JOTableViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation JOTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Logic

- (void)setData:(NSArray *)data containsSections:(BOOL)containsSections
{
    if (self->_data != data)
    {
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
    NSString *CellIdentifier = [self cellIdentifierForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    id object = [self objectAtIndexPath:indexPath];
    [self tableView:tableView configureCell:cell withObject:object atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self objectAtIndexPath:indexPath];
    [self tableView:tableView didSelectObject:object atIndexPath:indexPath];
}

@end
