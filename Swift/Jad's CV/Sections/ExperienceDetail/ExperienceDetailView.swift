//
//  ExperienceDetailView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailView: DynamicTypeView {
    struct LayoutConstants {
        struct Padding {
            static let top: CGFloat = 20.0
            static let betweenVerticalLarge: CGFloat = 15.0
            static let betweenVerticalSmall: CGFloat = 5.0
        }
    
        static let backButtonSize = CGSize(width: 48.0, height: 44.0)
        static let imagveViewSize = CGSize(width: 70.0, height: 70.0)
        static let imageViewMaskingRadius: CGFloat = 18.0
    }
        
    private(set) var backButton: UIButton!
    private(set) var organisationImageView: UIImageView!
    private(set) var positionLabel: UILabel!
    private(set) var organisationLabel: UILabel!
    private(set) var dateLabel: UILabel!
    private(set) var textView: FormattedTextView!
    
    init(frame: CGRect) {
        self.backButton = UIButton()
        self.organisationImageView = UIImageView()
        self.positionLabel = UILabel()
        self.organisationLabel = UILabel()
        self.dateLabel = UILabel()
        self.textView = FormattedTextView()
        
        super.init(frame: frame)
        
        let backImage = UIImage(named: "back")
        self.backButton.setImage(backImage, forState: .Normal)
        self.backButton.contentMode = .ScaleAspectFit
        self.backButton.frame.size = LayoutConstants.backButtonSize
        self.addSubview(self.backButton)
        
        self.organisationImageView.frame.size = LayoutConstants.imagveViewSize
        self.organisationImageView.maskToRadius(LayoutConstants.imageViewMaskingRadius)
        self.addSubview(self.organisationImageView)
        
        self.addSubview(self.positionLabel)
        self.addSubview(self.organisationLabel)
        self.addSubview(self.dateLabel)
        
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
        
        positionLabel.frame.size = positionLabel.sizeThatFits(bounds.size).ceilSize
        positionLabel.frame.origin.y = organisationImageView.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        positionLabel.centerHorizontallyWithReferenceView(self)

        organisationLabel.frame.size = organisationLabel.sizeThatFits(bounds.size).ceilSize
        organisationLabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        organisationLabel.centerHorizontallyWithReferenceView(self)
    
        dateLabel.frame.size = dateLabel.sizeThatFits(bounds.size).ceilSize
        dateLabel.frame.origin.y = organisationLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        dateLabel.centerHorizontallyWithReferenceView(self)
        
        textView.frame.origin.y = dateLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        textView.frame.size.width = bounds.size.width
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
    }
    
    //MARK: Dynamic type
    
    override func reloadDynamicTypeContent() {
        positionLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        organisationLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        dateLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        textView.font = CVFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
}
