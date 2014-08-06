//
//  ExperienceSplitViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//TODO: Create abstract superclass with generics, look at SplitViewController
class ExperienceSplitViewController: SplitViewController {
    
    //MARK:- Properties
    
    var experienceTableViewController: ExperienceTableViewController! {
    return masterViewController as? ExperienceTableViewController
    }
    
    var experienceDetailViewController: ExperienceDetailViewController! {
    return detailViewController as? ExperienceDetailViewController
    }
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(masterTableViewController: ExperienceTableViewController) {
        let indexPathZero = NSIndexPath(forRow: 0, inSection: 0)
        let experience = masterTableViewController.listData[indexPathZero]
        
        super.init(masterViewController: masterTableViewController, detailViewController: ExperienceDetailViewController(experience: experience!))
    }
    
    //MARK:- Delegate
    
    override func masterViewController(masterViewController: UIViewController, didSelectObject object: Any) {
        if let experience = object as? ExperienceObject {
            experienceDetailViewController.experience = experience
        }
    }
}
