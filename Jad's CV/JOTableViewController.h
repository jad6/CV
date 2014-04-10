//
//  JOTableViewController.h
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JOTableViewController : UITableViewController

@property (nonatomic, strong, readonly) NSArray *data;

- (void)setData:(NSArray *)data containsSections:(BOOL)containsSections;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView configureCell:(id)cell withObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath;

@end
