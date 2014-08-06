//
//  ExperienceDetailView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailView: DynamicTypeView {
    
    //MARK:- Constants
    
    private struct LayoutConstants {
        struct Padding {
            static let top: CGFloat = 20.0
            static let betweenVerticalLarge: CGFloat = 15.0
            static let betweenVerticalSmall: CGFloat = 3.0
        }
    
        static let imagveViewSize = CGSize(width: 70.0, height: 70.0)
        static let imageViewMaskingRadius: CGFloat = 18.0
    }
    
    //MARK:- Properties
    
    let organisationImageView = UIImageView()
    let positionLabel = UILabel()
    let organisationLabel = UILabel()
    let dateLabel = UILabel()
    let textView = FormattedTextView()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    //MARK:- Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        
        organisationImageView.frame.origin.y = LayoutConstants.Padding.top
        organisationImageView.centerHorizontallyWithReferenceRect(self.bounds)
        
        positionLabel.frame.size = positionLabel.sizeThatFits(bounds.size).ceilSize
        positionLabel.frame.origin.y = organisationImageView.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        positionLabel.centerHorizontallyWithReferenceRect(self.bounds)

        organisationLabel.frame.size = organisationLabel.sizeThatFits(bounds.size).ceilSize
        organisationLabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        organisationLabel.centerHorizontallyWithReferenceRect(self.bounds)
    
        dateLabel.frame.size = dateLabel.sizeThatFits(bounds.size).ceilSize
        dateLabel.frame.origin.y = organisationLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        dateLabel.centerHorizontallyWithReferenceRect(self.bounds)
        
        textView.frame.origin.y = dateLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        textView.frame.size.width = bounds.size.width
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
    }
    
    //MARK:- Dynamic type
    
    override func reloadDynamicTypeContent() {
        positionLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        organisationLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        dateLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        textView.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
}
