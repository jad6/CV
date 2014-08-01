//
//  ExperienceTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol ExperienceTableViewControllerDelegate {
    func experienceTableViewController(experienceTableViewController: ExperienceTableViewController, didSelectExperience experience: ExperienceObject)
}

//FIXME: Generics
//class ExperienceTableViewController<T: ExperienceObject>: DynamicTypeTableViewController {
class ExperienceTableViewController: DynamicTypeTableViewController {

    var delegate: ExperienceTableViewControllerDelegate?
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(style: UITableViewStyle, listData: ListData<TimelineEvent>) {
        super.init(style: style, listData: listData)
        
        self.clearsSelectionOnViewWillAppear = !UIDevice.isPad()
    }
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        if let experience = object as? ExperienceObject {
            if let tableCell = cell as? ExperienceTableViewCell {
                tableCell.positionLabel.text = experience.position
                tableCell.organisationLabel.text = experience.organisation
                tableCell.dateLabel.text = experience.timeSpentString(" /n  ")
            }
        }
    }
    
    override func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        if let experience = object as? ExperienceObject {
            if UIDevice.isPad() {
                delegate?.experienceTableViewController(self, didSelectExperience: experience)
            } else {
                let detailViewController = ExperienceDetailViewController(experience: experience)
                navigationController.pushViewController(detailViewController, animated: true)
            }
        }
    }
}
