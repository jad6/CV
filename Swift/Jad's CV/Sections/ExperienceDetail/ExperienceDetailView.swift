//
//  ExperienceDetailView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailView: UIView {
    struct LayoutConstants {
        struct Padding {

        }
    
        static let backButtonSize = CGSizeMake(44.0, 44.0)
        static let imagveViewSize = CGSizeMake(70.0, 70.0)
        static let imageViewMaskingRadius: CGFloat = 18.0
    }
    
    private(set) var swipeGestureReognizer: UISwipeGestureRecognizer!
    
    private(set) var backButton: UIButton!
    private(set) var organisationImageView: UIImageView!
    private(set) var positionLabel: UILabel!
    private(set) var organisationLabel: UILabel!
    private(set) var dateLabel: UILabel!
    private(set) var textView: FormattedTextView!
    
    init(frame: CGRect) {
        self.swipeGestureReognizer = UISwipeGestureRecognizer()
        
        self.backButton = UIButton()
        self.organisationImageView = UIImageView()
        self.positionLabel = UILabel()
        self.organisationLabel = UILabel()
        self.dateLabel = UILabel()
        self.textView = FormattedTextView()
        
        super.init(frame: frame)
        
        self.swipeGestureReognizer.direction = .Right
        self.addGestureRecognizer(self.swipeGestureReognizer)
        
        let backImage = UIImage(named: "back")
        self.backButton.setImage(backImage, forState: .Normal)
        self.backButton.contentMode = .ScaleAspectFit
        self.backButton.backgroundColor = UIColor.redColor()
        self.backButton.frame.size = LayoutConstants.backButtonSize
        self.addSubview(self.backButton)
        
        self.organisationImageView.frame.size = LayoutConstants.imagveViewSize
        self.organisationImageView.maskToRadius(LayoutConstants.imageViewMaskingRadius)
        self.addSubview(self.organisationImageView)
        
        self.positionLabel.font = UIFont.helveticaNeueBoldFontOfSize(15.0)
        self.addSubview(self.positionLabel)
        
        self.organisationLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.addSubview(self.organisationLabel)
        
        self.dateLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.addSubview(self.dateLabel)
        
        self.textView.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.addSubview(self.textView)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
}
