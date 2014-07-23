//
//  TimelineTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineTableViewController: TableViewController {
        
    //TODO: re-enable that once Swift supports class variables
    //    private class let defaultCellIdentifier = "Cell"
    
    private class func timelineCellIdentifier() -> String {
        return "Cell"
    }
        
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        var data = TimelineEvent.timelineEvents()
        
        super.init(style: .Plain, data: data)
        
        self.tableView.registerClass(TimelineEventTableViewCell.self, forCellReuseIdentifier: TimelineTableViewController.timelineCellIdentifier())
    }
    
    //MARK: Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        let tableCell = cell as TimelineEventTableViewCell
        
        if let timelineEvent = object as? TimelineEvent {
            tableCell.color = timelineEvent.color
            tableCell.positionLabel.text = timelineEvent.position
            tableCell.organisationLabel.text = timelineEvent.organisation
            tableCell.dateLabel.text = timelineEvent.timeSpentString
        }
    }
    
    override func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        // Override me!
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return TimelineTableViewController.timelineCellIdentifier()
    }
}
