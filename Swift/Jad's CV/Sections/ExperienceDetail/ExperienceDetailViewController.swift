//
//  ExperienceDetailViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK:- Properties

    var detailView: ExperienceDetailView! {
    return view as? ExperienceDetailView
    }
    
    var experience: ExperienceObject {
    didSet {
        setupExperienceInfo()
    }
    }
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        self.experience = ExtraCurricularActivity.extraCurricularActivities().first!
        
        super.init(coder: aDecoder)
    }
    
    init(experience: ExperienceObject) {
        self.experience = experience
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK:- View lifecycle
    
    override func loadView() {
        view = UIDevice.isPad() ? ExperienceDetailView() : ExperienceDetailView_Phone()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController != nil {
            navigationController.interactivePopGestureRecognizer.delegate = self
        }

        if let detailView_phone = detailView as? ExperienceDetailView_Phone {
            detailView_phone.backButton.addTarget(self, action: "backAction:", forControlEvents: .TouchUpInside)
        }
        
        setupExperienceInfo()
    }
    
    //MARK:- Actions
    
    func backAction(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
    
    //MARK:- Logic
    
    func setupExperienceInfo() {
        if let image = experience.organisationImage {
            detailView.organisationImageView.image = image
        }
        detailView.organisationLabel.text = experience.organisation
        detailView.dateLabel.text = experience.timeSpentString(" - ")
        detailView.textView.text = experience.detailedDescription
        detailView.positionLabel.text = experience.position
    }
}
