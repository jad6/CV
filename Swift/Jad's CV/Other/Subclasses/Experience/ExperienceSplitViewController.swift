//
//  ExperienceSplitViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//TODO: Create abstract superclass with generics, look at SplitViewController
class ExperienceSplitViewController: UIViewController, ExperienceTableViewControllerDelegate {

    //TODO: This would be moved to the super class
    var splitView: SplitView! {
    return view as? SplitView
    }
    
    var experienceTableViewController: ExperienceTableViewController!
    var detailViewController: ExperienceDetailViewController!
    
    init(masterViewController: ExperienceTableViewController, detailViewController: ExperienceDetailViewController) {
        self.experienceTableViewController = masterViewController
        self.detailViewController = detailViewController
        
        super.init(nibName: nil, bundle: nil)
        
        self.experienceTableViewController.delegate = self
    }
    
    //TODO: This would be moved to the super class
    override func loadView() {
        
    }
    
    //MARK: Experience table view controller
    
    func experienceTableViewController(experienceTableViewController: ExperienceTableViewController, didSelectExperience experience: ExperienceObject) {
        
    }
}
