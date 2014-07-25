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
            static let top: CGFloat = 20.0
            static let betweenVerticalLarge: CGFloat = 15.0
            static let betweenVerticalSmall: CGFloat = 5.0
        }
    
        static let backButtonSize = CGSizeMake(48.0, 44.0)
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
        self.swipeGestureReognizer = UISwipeGestureRecognizer(target: nil, action: nil)
        
        self.backButton = UIButton()
        self.organisationImageView = UIImageView()
        self.positionLabel = UILabel()
        self.organisationLabel = UILabel()
        self.dateLabel = UILabel()
        self.textView = FormattedTextView()
        
        super.init(frame: frame)
        
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
        if UIDevice.isPad() {
            self.textView.textContainerInset = UIEdgeInsets(top: 0.0, left: 44.0, bottom: 0.0, right: 44.0)
        } else {
            self.textView.textContainerInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        }
        
        self.addSubview(self.textView)
        
        self.backgroundColor = UIColor.backgroundGrayColor()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        organisationImageView.frame.origin.y = LayoutConstants.Padding.top
        organisationImageView.centerHorizontallyWithReferenceView(self)
        
        positionLabel.frame.size = CGSizeCeil(positionLabel.sizeThatFits(bounds.size))
        positionLabel.frame.origin.y = CGRectGetMaxY(organisationImageView.frame) + LayoutConstants.Padding.betweenVerticalLarge
        positionLabel.centerHorizontallyWithReferenceView(self)

        organisationLabel.frame.size = CGSizeCeil(organisationLabel.sizeThatFits(bounds.size))
        organisationLabel.frame.origin.y = CGRectGetMaxY(positionLabel.frame) + LayoutConstants.Padding.betweenVerticalSmall
        organisationLabel.centerHorizontallyWithReferenceView(self)
    
        dateLabel.frame.size = CGSizeCeil(dateLabel.sizeThatFits(bounds.size))
        dateLabel.frame.origin.y = CGRectGetMaxY(organisationLabel.frame) + LayoutConstants.Padding.betweenVerticalSmall
        dateLabel.centerHorizontallyWithReferenceView(self)
        
        textView.frame.origin.y = CGRectGetMaxY(dateLabel.frame) + LayoutConstants.Padding.betweenVerticalLarge
        textView.frame.size.width = bounds.size.width
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
    }
}
