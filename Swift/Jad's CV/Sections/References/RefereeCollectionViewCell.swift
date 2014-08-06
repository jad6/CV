//
//  RefereeCollectionViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class RefereeCollectionViewCell: DynamicTypeCollectionViewCell {

    //MARK:- Constants
    
    private struct LayoutConstants {
        struct Padding {
            static let top: CGFloat = 15.0
            static let side: CGFloat = 15.0
            static let bottom: CGFloat = 15.0
            static let sideSmall: CGFloat = 4.0
            static let betweenHorizontal: CGFloat = 10.0
            static let betweenVerticalSmall: CGFloat = 3.0
            static let betweenVerticalLarge: CGFloat = 4.0
            static let betweenInfoAndContact: CGFloat = 8.0
        }
        
        struct Separator {
            static let height: CGFloat = 1.0
            static let widthFactor: CGFloat = 0.66
        }
        
        static let photoImageViewSize = CGSize(width: 70.0, height: 70.0)
    }
    
    //MARK:- Properties
    
    let photoImageView = UIImageView()
    let fullNameLabel = UILabel()
    let positionLabel = UILabel()
    let locationlabel = UILabel()
    let connectionLabel = UILabel()
    let phoneButton = UIButton()
    let emailButton = UIButton()
    
    private let cardBackgroundImageView = UIImageView()
    private let separatorView = UIView()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let cardImage = UIImage(named: "conatct-card").resizableImageWithCapInsets(UIEdgeInsets(top: 2.0, left: 4.0, bottom: 6.0, right: 4.0))
        self.cardBackgroundImageView.image = cardImage
        self.contentView.addSubview(self.cardBackgroundImageView)
        
        self.separatorView.backgroundColor = UIColor.lightGrayColor()
        self.contentView.addSubview(self.separatorView)
        
        self.contentView.addSubview(self.photoImageView)
        
        self.fullNameLabel.numberOfLines = 2
        self.contentView.addSubview(self.fullNameLabel)
        
        self.positionLabel.numberOfLines = 2
        self.contentView.addSubview(self.positionLabel)
        
        self.locationlabel.numberOfLines = 2
        self.contentView.addSubview(self.locationlabel)
        
        self.connectionLabel.numberOfLines = 3
        self.contentView.addSubview(self.connectionLabel)
        
        self.emailButton.setTitleColor((UIDevice.canEmail() ? UIColor.defaultBlueColor() : UIColor.darkGrayColor()), forState: .Normal)
        self.contentView.addSubview(self.emailButton)
        
        self.phoneButton.setTitleColor((UIDevice.canCall() ? UIColor.defaultBlueColor() : UIColor.darkGrayColor()), forState: .Normal)
        self.contentView.addSubview(self.phoneButton)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame.size = LayoutConstants.photoImageViewSize
        photoImageView.frame.origin.x = LayoutConstants.Padding.side
        photoImageView.frame.origin.y = LayoutConstants.Padding.top
        photoImageView.maskToCircle()
        
        let labelXOrigin = photoImageView.frame.maxX + LayoutConstants.Padding.betweenHorizontal
        let boundingLabelWidth = bounds.size.width - labelXOrigin - LayoutConstants.Padding.sideSmall
        let boundingLabelSize = CGSize(width: boundingLabelWidth, height: bounds.size.height)
        
        fullNameLabel.frame.size = fullNameLabel.sizeThatFits(boundingLabelSize).ceilSize
        fullNameLabel.frame.origin.x = labelXOrigin
        fullNameLabel.frame.origin.y = LayoutConstants.Padding.top
        
        positionLabel.frame.size = positionLabel.sizeThatFits(boundingLabelSize).ceilSize
        positionLabel.frame.origin.x = labelXOrigin
        positionLabel.frame.origin.y = fullNameLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        
        locationlabel.frame.size = locationlabel.sizeThatFits(boundingLabelSize).ceilSize
        locationlabel.frame.origin.x = labelXOrigin
        locationlabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        
        connectionLabel.frame.size = connectionLabel.sizeThatFits(boundingLabelSize).ceilSize
        connectionLabel.frame.origin.x = labelXOrigin
        connectionLabel.frame.origin.y = locationlabel.frame.maxY + LayoutConstants.Padding.betweenVerticalSmall
        
        phoneButton.frame.size = phoneButton.sizeThatFits(bounds.size).ceilSize
        phoneButton.frame.origin.y = max(connectionLabel.frame.maxY, photoImageView.frame.maxY) + LayoutConstants.Padding.betweenInfoAndContact
        phoneButton.centerHorizontallyWithReferenceRect(self.contentView.bounds)
        
        separatorView.frame.size.width = floor(bounds.size.width * LayoutConstants.Separator.widthFactor)
        separatorView.frame.size.height = LayoutConstants.Separator.height
        separatorView.frame.origin.y = phoneButton.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        separatorView.centerHorizontallyWithReferenceRect(self.contentView.bounds)

        emailButton.frame.size = emailButton.sizeThatFits(bounds.size).ceilSize
        emailButton.frame.origin.y = separatorView.frame.maxY + LayoutConstants.Padding.betweenVerticalLarge
        emailButton.centerHorizontallyWithReferenceRect(self.contentView.bounds)
        
        cardBackgroundImageView.frame = bounds
    }
    
    //MARK:- Dynamic type
    
    override func reloadDynamicTypeContent() {
        fullNameLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        positionLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        locationlabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        connectionLabel.font = DynamicTypeFont.preferredFontForTextStyle(CVFontTextStyleCaption2Italic)
        emailButton.titleLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleBody)
        phoneButton.titleLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
    
    override func optimalCellSize() -> CGSize {
        let minY = min(fullNameLabel.frame.minY, photoImageView.frame.minY)
        let Δ: CGFloat = emailButton.frame.maxY - minY
        
        let height = Δ + (2 * LayoutConstants.Padding.top)
        
        return CGSize(width: frame.size.width, height: height)
    }
}
