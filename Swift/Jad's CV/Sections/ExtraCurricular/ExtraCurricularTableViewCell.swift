//
//  ExtraCurricularTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExtraCurricularTableViewCell: GraySelectionTableViewCell {
    struct LayoutConstants {
        struct Padding {
            static let side: CGFloat = 15.0
            static let betweenVertical: CGFloat = 2.0
            static let betweenHorizontal: CGFloat = 10.0
            static let accessoryViewWidth: CGFloat = 30.0
        }
        
        static let imageViewMaskingRadius: CGFloat = 18.0
        static let imageViewSize = CGSize(width: 70.0, height: 70.0)
    }
    
    private(set) var activityImageView: UIImageView!
    private(set) var positionLabel: UILabel!
    private(set) var organisationLabel: UILabel!
    private(set) var dateLabel: UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        self.activityImageView = UIImageView()
        self.positionLabel = UILabel()
        self.organisationLabel = UILabel()
        self.dateLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.activityImageView)
        
        contentView.addSubview(self.activityImageView)
        
        self.positionLabel.numberOfLines = 2
        self.contentView.addSubview(self.positionLabel)
        
        self.organisationLabel.numberOfLines = 2
        self.contentView.addSubview(self.organisationLabel)
        
        contentView.addSubview(self.dateLabel)
        
        if !UIDevice.isPad() {
            self.accessoryType = .DisclosureIndicator
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        activityImageView.frame.size = LayoutConstants.imageViewSize
        activityImageView.frame.origin.x = LayoutConstants.Padding.side
        activityImageView.centerVerticallyWithReferenceView(self.contentView)
        activityImageView.maskToRadius(LayoutConstants.imageViewMaskingRadius)
        
        let labelXOrigin = activityImageView.frame.maxX + LayoutConstants.Padding.betweenHorizontal
        let boundingLabelWidth = bounds.size.width - labelXOrigin - (UIDevice.isPad() ? 0.0 : LayoutConstants.Padding.accessoryViewWidth)
        let boundingLabelSize = CGSize(width: boundingLabelWidth, height: bounds.size.height)
        
        positionLabel.frame.size = positionLabel.sizeThatFits(boundingLabelSize).ceilSize
        positionLabel.frame.origin.x = labelXOrigin
        
        organisationLabel.frame.size = organisationLabel.sizeThatFits(boundingLabelSize).ceilSize
        organisationLabel.frame.origin.x = labelXOrigin
        
        dateLabel.frame.size = dateLabel.sizeThatFits(boundingLabelSize).ceilSize
        dateLabel.frame.origin.x = labelXOrigin

        let totalLabelHeights = totalHeight(views: [positionLabel, organisationLabel, dateLabel], separatorLength: LayoutConstants.Padding.betweenVertical)
        
        positionLabel.frame.origin.y = floor((bounds.size.height - totalLabelHeights) / 2.0)
        organisationLabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
        dateLabel.frame.origin.y = organisationLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
    }
    
    //MARK: Dynamic type
    
    override func reloadDynamicTypeContent() {
        positionLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        organisationLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleBody)
        dateLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
}
