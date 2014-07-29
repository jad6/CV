//
//  EducationViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {
    
    var education: Education
    
    var educationView: EducationView! {
    return view as? EducationView
    }
    
    //MARK: Init
    
    init() {
        self.education = Education.education()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: View lifecycle
    
    override func loadView() {
        view = UIDevice.isPad() ? EducationView_Pad() : EducationView_Phone()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEducationView()
    }
    
    //MARK: Logic
    
    func setupEducationView() {
        educationView.universityLogoImageView.image = education.universityLogo
        educationView.statusLabel.text = education.status
        educationView.establishmentLabel.text = education.establishment
        educationView.completionDateLabel.text = education.completion
        educationView.textView.text = education.detailDescription
        educationView.backgroundImageView.image = education.backgroundImage
    }
}
