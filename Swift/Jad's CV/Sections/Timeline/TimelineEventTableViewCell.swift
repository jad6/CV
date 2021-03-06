//
//  TimelineEventTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineEventTableViewCell: ExperienceTableViewCell {
    
    //MARK:- Constants
    
    private struct LayoutConstants {
        struct CircleSizes {
            static let big = CGSize(width: 24.0, height: 24.0)
            static let small = CGSize(width: 10.0, height: 10.0)
        }
        
        struct Padding {
            static let top: CGFloat = 30.0
            static let side: CGFloat = 15.0
            static let betweenDateAndCircle: CGFloat = 2.0
            static let betweenCircleAndLabels: CGFloat = 10.0
            static let betweenVertical: CGFloat = 3.0
        }
        
        static let lineViewWidth: CGFloat = 2.0
        static let dateLabelSize = CGSize(width: 50.0, height: 30.0)
        
        static func circleViewSizeForImportance(importance: TimelineEvent.Importance) -> CGSize {
            switch (importance) {
            case .Minor:
                return CircleSizes.small
            case .Major:
                return CircleSizes.big
            case .None:
                return CGSizeZero
            }
        }
    }
    
    //MARK:- Properties
    
    private let circleView = UIView()
    let lineView = UIView()
    
    var importance: TimelineEvent.Importance = .Minor {
    didSet {
        layoutIfNeeded()
    }
    }
    
    var color: UIColor! {
    didSet {
        positionLabel.textColor = color
        organisationLabel.textColor = color
        dateLabel.textColor = color
        circleView.backgroundColor = color
        
        if !UIDevice.isPad() {
            accessoryView.tintColor = color
        }
    }
    }
    
    //MARK:- Init

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.lineView.backgroundColor = UIColor.timelineGrayColor()
        self.contentView.addSubview(self.lineView)
        
        self.contentView.addSubview(self.circleView)
        
        if !UIDevice.isPad() {
            let accessoryImage = UIImage(named: "chevron").imageWithRenderingMode(.AlwaysTemplate)
            let accessoryImageView = UIImageView(image: accessoryImage)
            accessoryImageView.sizeToFit()
            self.accessoryView = accessoryImageView
        }
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateLabel.frame.size = LayoutConstants.dateLabelSize
        dateLabel.frame.origin.x = LayoutConstants.Padding.side
        dateLabel.centerVerticallyWithReferenceRect(self.contentView.bounds)
        
        circleView.frame.size = LayoutConstants.circleViewSizeForImportance(importance)
        if importance != .Major {
            circleView.frame.origin.x = dateLabel.frame.maxX + LayoutConstants.Padding.betweenDateAndCircle + floor((LayoutConstants.CircleSizes.big.width - circleView.frame.size.width) / 2.0)
        } else {
            circleView.frame.origin.x = dateLabel.frame.maxX + LayoutConstants.Padding.betweenDateAndCircle
        }
        circleView.centerVerticallyWithReferenceRect(self.contentView.bounds)
        circleView.maskToCircle()
        
        lineView.frame.size.width = LayoutConstants.lineViewWidth
        lineView.frame.size.height = bounds.size.height
        lineView.frame.origin.x = circleView.frame.origin.x + floor((circleView.frame.size.width - lineView.frame.size.width) / 2.0)
        
        let labelXOrigin = circleView.frame.maxX + LayoutConstants.Padding.betweenCircleAndLabels
        var boundingLabelWidth: CGFloat = bounds.size.width - labelXOrigin
        if accessoryView != nil {
            boundingLabelWidth -= UIDevice.isPad() ? 0.0 : (bounds.size.width - accessoryView.frame.minX)
        }
        let boundingLabelSize = CGSize(width: boundingLabelWidth, height: bounds.size.height)
        
        positionLabel.frame.size = positionLabel.sizeThatFits(boundingLabelSize).ceilSize
        positionLabel.frame.origin.x = labelXOrigin
        
        organisationLabel.frame.size = organisationLabel.sizeThatFits(boundingLabelSize).ceilSize
        organisationLabel.frame.origin.x = labelXOrigin
        
        let totalLabelHeights = totalHeight(views: [positionLabel, organisationLabel], separatorLength: LayoutConstants.Padding.betweenVertical)
        
        positionLabel.frame.origin.y = floor((bounds.size.height - totalLabelHeights) / 2.0)
        organisationLabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
    }
    
    //MARK:- Selection
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        lineView.backgroundColor = UIColor.timelineGrayColor()
        circleView.backgroundColor = color
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        lineView.backgroundColor = UIColor.timelineGrayColor()
        circleView.backgroundColor = color
    }
    
    //MARK:- Dynamic type
    
    override func reloadDynamicTypeContent() {
        positionLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        organisationLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleBody)
        dateLabel.font = DynamicTypeFont.preferredFontForTextStyle(CVFontTextStyleTimelineDate)
    }
    
    override func optimalCellheight() -> CGFloat {
        let Δ = organisationLabel.frame.maxY - positionLabel.frame.minY
        return Δ + (2 * LayoutConstants.Padding.top)
    }
}
