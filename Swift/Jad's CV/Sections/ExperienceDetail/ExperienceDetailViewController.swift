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
    
    let experience: ExperienceObject
    
    //MARK: Init
    
    init(experience: ExperienceObject) {

        //FIXME: ... Words cannot describe this Xcode fail
//        self.experience = experience
        self.experience = TimelineEvent.timelineEvents()[0]
        
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
        
        if let image = experience.organisationImage {
            detailView.organisationImageView.image = image
        }
        detailView.organisationLabel.text = experience.organisation
        detailView.dateLabel.text = experience.startDate.combinedCondensedStringWithEndDate(experience.endDate, withSeparator: " - ")
        detailView.textView.text = experience.detailedDescription
        detailView.positionLabel.text = experience.position
    }
    
    //MARK: Actions
    
    func backAction(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
}
