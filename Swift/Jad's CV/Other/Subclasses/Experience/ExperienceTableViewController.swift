//
//  ExperienceTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//FIXME: Generics
//class ExperienceTableViewController<T: ExperienceObject>: DynamicTypeTableViewController {
class ExperienceTableViewController: DynamicTypeTableViewController {

    //MARK:- Properties
    
    var delegate: MasterViewControllerDelegate?
    
    //MARK:- Init
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(style: UITableViewStyle, listData: ListData<TimelineEvent>) {
        super.init(style: style, listData: listData)
        
        self.clearsSelectionOnViewWillAppear = !UIDevice.isPad()
    }
    
    //MARK:- View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indexPathZero = NSIndexPath(forRow: 0, inSection: 0)
        if UIDevice.isPad() && listData.isValidIndexPath(indexPathZero) {
            tableView.selectRowAtIndexPath(indexPathZero, animated: false, scrollPosition: .Top)
            tableView(tableView, didSelectRowAtIndexPath: indexPathZero)
        }
    }
    
    //MARK:- Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any, atIndexPath indexPath: NSIndexPath) {
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
                delegate?.masterViewController(self, didSelectObject: object)
            } else {
                let detailViewController = ExperienceDetailViewController(experience: experience)
                navigationController.pushViewController(detailViewController, animated: true)
            }
        }
    }
}
