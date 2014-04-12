//
//  JOTableViewController.h
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

#import <UIKit/UIKit.h>

/**
 *  Abstract table view subclass which makes populating a table view from
 *  a data source of object easy and uncomplicated.
 */
@interface JOTableViewController : UITableViewController

/// The data for the table view. The format will always include multiple
/// sections. To set data (for single section & multiple sections) please
/// use setData:containsSections:.
@property (nonatomic, strong, readonly) NSArray *data;

/**
 *  Custom setter to allow for data sources formatted for multiple
 *  sections or a singular section.
 *
 *  @param data             The given data to display.
 *  @param containsSections A flag set if the data given has been formatted for
 *                          multiple sections.
 */
- (void)setData:(NSArray *)data containsSections:(BOOL)containsSections;

/**
 *  Returns the object from the data source associated with the given
 *  index path.
 *
 *  @param indexPath The index path of the object in the data source.
 *
 *  @return The object at the given index path.
 */
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Helper method to configure a cell at the given index path with a given
 *  object.
 *
 *  @param tableView The table view who's cell is configured.
 *  @param cell      The cell to configure.
 *  @param object    The object which matches the cell's index path.
 *  @param indexPath The index path of the cell to configure.
 */
- (void)tableView:(UITableView *)tableView configureCell:(id)cell withObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

/**
 *  Called when the user selects a cell a the given index path.
 *
 *  @param tableView The table view who is interacted with.
 *  @param object    The object at the selected index path.
 *  @param indexPath The index path of the cell which was selected.
 */
- (void)tableView:(UITableView *)tableView didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

/**
 *  The cell identifier for the given index path.
 *
 *  @param indexPath The index path of the cell.
 *
 *  @return The cell identifier.
 */
- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath;

@end
