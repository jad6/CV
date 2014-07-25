//
//  TimelineEventTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineEventTableViewCell: UITableViewCell {
    struct LayoutConstants {
        struct CircleSizes {
            static let big = CGSize(width: 24.0, height: 24.0)
            static let small = CGSize(width: 10.0, height: 10.0)
        }
        
        struct Padding {
            static let side: CGFloat = 15.0
            static let betweenDateAndCircle: CGFloat = 2.0
            static let betweenCircleAndLabels: CGFloat = 10.0
            static let betweenVertical: CGFloat = 4.0
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
    
    private var circleView: UIView!
    private(set) var lineView: UIView!
    
    private(set) var positionLabel: UILabel!
    private(set) var organisationLabel: UILabel!
    private(set) var dateLabel: UILabel!
    
    var importance: TimelineEvent.Importance {
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
        accessoryView.tintColor = color
    }
    }

    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        self.circleView = UIView()
        self.lineView = UIView()
        self.positionLabel = UILabel()
        self.organisationLabel = UILabel()
        self.dateLabel = UILabel()
        self.importance = .Minor
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let accessoryImage = UIImage(named: "chevron").imageWithRenderingMode(.AlwaysTemplate)
        let accessoryImageView = UIImageView(image: accessoryImage)
        accessoryImageView.sizeToFit()
        self.accessoryView = accessoryImageView
        
        self.lineView.backgroundColor = UIColor.backgroundGrayColor()
        self.addSubview(self.lineView)
        
        self.addSubview(self.circleView)
        
        self.positionLabel.font = UIFont.helveticaNeueMediumFontOfSize(15.0)
        self.positionLabel.numberOfLines = 2
        self.addSubview(self.positionLabel)
        
        self.organisationLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.organisationLabel.numberOfLines = 2
        self.addSubview(self.organisationLabel)
        
        self.dateLabel.font = UIFont.helveticaNeueItalicFontOfSize(12.0)
        self.dateLabel.numberOfLines = 2
        self.addSubview(self.dateLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateLabel.frame.size = LayoutConstants.dateLabelSize
        dateLabel.frame.origin.x = LayoutConstants.Padding.side
        dateLabel.centerVerticallyWithReferenceView(self)
        
        circleView.frame.size = LayoutConstants.circleViewSizeForImportance(importance)
        if importance != .Major {
            circleView.frame.origin.x = dateLabel.frame.maxX + LayoutConstants.Padding.betweenDateAndCircle + floor((LayoutConstants.CircleSizes.big.width - circleView.frame.size.width) / 2.0)
        } else {
            circleView.frame.origin.x = dateLabel.frame.maxX + LayoutConstants.Padding.betweenDateAndCircle
        }
        circleView.centerVerticallyWithReferenceView(self)
        circleView.maskToCircle()
        
        lineView.frame.size.width = LayoutConstants.lineViewWidth
        lineView.frame.size.height = bounds.size.height
        lineView.frame.origin.x = circleView.frame.origin.x + floor((circleView.frame.size.width - lineView.frame.size.width) / 2.0)
        
        let labelXOrigin = circleView.frame.maxX + LayoutConstants.Padding.betweenCircleAndLabels
        let boundingLabelWidth = bounds.size.width - labelXOrigin - (bounds.size.width - accessoryView.frame.minX)
        let boundingLabelSize = CGSize(width: boundingLabelWidth, height: bounds.size.height)
        
        positionLabel.frame.size = positionLabel.sizeThatFits(boundingLabelSize).ceilSize
        positionLabel.frame.origin.x = labelXOrigin
        
        organisationLabel.frame.size = organisationLabel.sizeThatFits(boundingLabelSize).ceilSize
        organisationLabel.frame.origin.x = labelXOrigin
        
        let totalLabelHeights = positionLabel.frame.size.height + LayoutConstants.Padding.betweenVertical + organisationLabel.frame.size.height
        
        positionLabel.frame.origin.y = floor((bounds.size.height - totalLabelHeights) / 2.0)
        organisationLabel.frame.origin.y = positionLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
    }
}
