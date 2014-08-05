//
//  ExtraCurricularTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//FIXME: Generics
//class ExtraCurricularTableViewController<T: ExtraCurricularActivity>: ExperienceTableViewController<T> {
class ExtraCurricularTableViewController: ExperienceTableViewController {
    
    //MARK:- Properties

    //TODO: re-enable that once Swift supports class variables
    //    private class let extraCurricularCellIdentifier = "Extra Curricular Cell"
    
    private class func extraCurricularCellIdentifier() -> String {
        return "Extra Curricular Cell"
    }
    
    //MARK:- Init
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
//    init() {
//        super.init(style: .Plain, listData: ExtraCurricularActivity.extraCurricularActivitiesListData())
//        
//        self.title = "Extra Curricular"
//        self.tableView.registerClass(ExtraCurricularTableViewCell.self, forCellReuseIdentifier: ExtraCurricularTableViewController.extraCurricularCellIdentifier())
//    }
    
    //MARK:- Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any, atIndexPath indexPath: NSIndexPath) {
        super.listView(listView, configureCell: cell, withObject: object, atIndexPath: indexPath)

        if let activity = object as? ExtraCurricularActivity {
            if let tableCell = cell as? ExtraCurricularTableViewCell {
                tableCell.activityImageView.image = activity.organisationImage
            }
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return ExtraCurricularTableViewController.extraCurricularCellIdentifier()
    }
}
