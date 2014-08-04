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
    
    var experienceTableViewController: ExperienceTableViewController! {
    return masterViewController as? ExperienceTableViewController
    }
    
    var experienceDetailViewController: ExperienceDetailViewController! {
    return detailViewController as? ExperienceDetailViewController
    }
    
    override func masterViewController(masterViewController: UIViewController, didSelectObject object: Any) {
        if let experience = object as? ExperienceObject {
            experienceDetailViewController.experience = experience
        }
    }
}
