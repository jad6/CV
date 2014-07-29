//
//  ExtraCurricularTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExtraCurricularTableViewController: TableViewController {

    //TODO: re-enable that once Swift supports class variables
    //    private class let extraCurricularCellIdentifier = "Extra Curricular Cell"
    
    private class func extraCurricularCellIdentifier() -> String {
        return "Extra Curricular Cell"
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init() {
        super.init(style: .Plain, listData: ExtraCurricularActivity.extraCurricularActivitiesListData())
        
        self.title = "Extra Curricular"
        
        self.clearsSelectionOnViewWillAppear = !UIDevice.isPad()
        self.tableView.registerClass(ExtraCurricularTableViewCell.self, forCellReuseIdentifier: ExtraCurricularTableViewController.extraCurricularCellIdentifier())
    }
    
    //MARK: Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        let tableCell = cell as ExtraCurricularTableViewCell
        
        if let activity = object as? ExtraCurricularActivity {
            tableCell.activityImageView.image = activity.organisationImage
            tableCell.positionLabel.text = activity.position
            tableCell.organisationLabel.text = activity.organisation
            tableCell.dateLabel.text = activity.timeSpentString(" - ")
        }
    }
    
    override func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        let activity = object as ExtraCurricularActivity
        
        if UIDevice.isPad() {
            
        } else {
            let detailViewController = ExperienceDetailViewController(experience: activity)
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return ExtraCurricularTableViewController.extraCurricularCellIdentifier()
    }
    
    //MARK: Table view
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 120.0
    }
}
