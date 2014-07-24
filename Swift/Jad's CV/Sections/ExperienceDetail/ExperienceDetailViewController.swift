//
//  ExperienceDetailViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {

    var detailView: ExperienceDetailView! {
    return view as? ExperienceDetailView
    }
    
    var experienceObject: ExperienceObject
    
    //MARK: Init
    
    init(experienceObject: ExperienceObject) {
        self.experienceObject = experienceObject
        
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: View lifecycle
    
    override func loadView() {
        view = ExperienceDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.backButton.addTarget(self, action: "backAction:", forControlEvents: .TouchUpInside)
        detailView.swipeGestureReognizer.addTarget(self, action: "backAction:")
    }
    
    //MARK: Actions
    
    func backAction(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
}
