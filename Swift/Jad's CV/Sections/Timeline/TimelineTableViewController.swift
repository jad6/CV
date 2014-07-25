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
        return "Timeline Cell"
    }
    
//    init() {        
//        super.init(listData: TimelineEvent.timelineEventsListData())
//        
//        self.title = "Experience"
//        
//        self.clearsSelectionOnViewWillAppear = !UIDevice.isPad()
//        self.tableView.separatorStyle = .None
//        self.tableView.registerClass(TimelineEventTableViewCell.self, forCellReuseIdentifier: TimelineTableViewController.timelineCellIdentifier())
//    }
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = TimelineTableBackgroundView()
    }
    
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
        let tableCell = cell as TimelineEventTableViewCell
        
        if let timelineEvent = object as? TimelineEvent {
            tableCell.color = timelineEvent.color
            tableCell.positionLabel.text = timelineEvent.position
            tableCell.organisationLabel.text = timelineEvent.organisation
            tableCell.dateLabel.text = timelineEvent.timeSpentString(" /n  ")
            tableCell.importance = timelineEvent.importance
        }
    }
    
    override func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        let timelineEvent = object as TimelineEvent
        
        if UIDevice.isPad() {
            
        } else {
            let detailViewController = ExperienceDetailViewController(experience: timelineEvent)
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return TimelineTableViewController.timelineCellIdentifier()
    }
    
    //MARK: Table view
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 100.0
    }
}
