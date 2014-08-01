//
//  TimelineTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//FIXME: Generics
//class TimelineTableViewController<T: TimelineEvent>: ExperienceTableViewController<T> {
class TimelineTableViewController: ExperienceTableViewController {
    
    //TODO: re-enable that once Swift supports class variables
    //    private class let defaultCellIdentifier = "Cell"
    
    private class func timelineCellIdentifier() -> String {
        return "Timeline Cell"
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {        
        super.init(style: .Plain, listData: TimelineEvent.timelineEventsListData())
        
        self.title = "Experience"
        
        self.tableView.registerClass(TimelineEventTableViewCell.self, forCellReuseIdentifier: TimelineTableViewController.timelineCellIdentifier())
        self.tableView.separatorStyle = .None
        self.tableView.backgroundView = TimelineTableBackgroundView()
    }
    
    //MARK: View lifecycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let backgroundView = tableView.backgroundView as TimelineTableBackgroundView
        if let cell = tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as? TimelineEventTableViewCell {
            backgroundView.lineView.frame.size.width = cell.lineView.frame.size.width
            backgroundView.lineView.frame.origin.x = cell.lineView.frame.origin.x
        }
    }
    
    //MARK: Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        super.listView(listView, configureCell: cell, withObject: object, atIndexPath: indexPath)
        
        if let timelineEvent = object as? TimelineEvent {
            if let tableCell = cell as? TimelineEventTableViewCell {
                tableCell.color = timelineEvent.color
                tableCell.importance = timelineEvent.importance
            }
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return TimelineTableViewController.timelineCellIdentifier()
    }
}
