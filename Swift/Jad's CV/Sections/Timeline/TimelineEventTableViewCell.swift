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
            static let big = CGSizeMake(24.0, 24.0)
            static let small = CGSizeMake(10.0, 10.0)
        }
        
        struct Padding {
            static let side: CGFloat = 15.0
            static let betweenDateAndCircle: CGFloat = 2.0
            static let betweenCircleAndLabels: CGFloat = 10.0
            static let betweenVertical: CGFloat = 4.0
        }
        
        static let lineViewWidth: CGFloat = 2.0
        static let dateLabelSize = CGSizeMake(50.0, 30.0)
        
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
        
        self.lineView.backgroundColor = UIColor.lightGrayColor()
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
        
        var dateLabelFrame = dateLabel.frame
        dateLabelFrame.size = LayoutConstants.dateLabelSize
        dateLabelFrame.origin.x = LayoutConstants.Padding.side
        dateLabelFrame.origin.y = floor((bounds.size.height - dateLabelFrame.size.height) / 2.0)
        dateLabel.frame = dateLabelFrame
        
        var circleViewFrame = circleView.frame
        circleViewFrame.size = LayoutConstants.circleViewSizeForImportance(importance)
        if importance != .Major {
            circleViewFrame.origin.x = CGRectGetMaxX(dateLabelFrame) + LayoutConstants.Padding.betweenDateAndCircle + floor((LayoutConstants.CircleSizes.big.width - circleViewFrame.size.width) / 2.0)
        } else {
            circleViewFrame.origin.x = CGRectGetMaxX(dateLabelFrame) + LayoutConstants.Padding.betweenDateAndCircle
        }
        circleViewFrame.origin.y = floor((bounds.size.height - circleViewFrame.size.height) / 2.0)
        circleView.frame = circleViewFrame
        circleView.maskToCircle()
        
        var lineViewFrame = lineView.frame
        lineViewFrame.size.width = LayoutConstants.lineViewWidth
        lineViewFrame.size.height = bounds.size.height
        lineViewFrame.origin.x = circleViewFrame.origin.x + floor((circleViewFrame.size.width - lineViewFrame.size.width) / 2.0)
        lineView.frame = lineViewFrame
        
        let labelXOrigin = CGRectGetMaxX(circleViewFrame) + LayoutConstants.Padding.betweenCircleAndLabels
        let boundingLabelWidth = bounds.size.width - labelXOrigin - (bounds.size.width - CGRectGetMinX(accessoryView.frame))
        let boundingLabelSize = CGSizeMake(boundingLabelWidth, bounds.size.height)
        
        var positionLabelFrame = positionLabel.frame
        positionLabelFrame.size = CGSizeCeil(positionLabel.sizeThatFits(boundingLabelSize))
        positionLabelFrame.origin.x = labelXOrigin
        
        var organisationLabelFrame = organisationLabel.frame
        organisationLabelFrame.size = CGSizeCeil(organisationLabel.sizeThatFits(boundingLabelSize))
        organisationLabelFrame.origin.x = labelXOrigin
        
        let totalLabelHeights = positionLabelFrame.size.height + LayoutConstants.Padding.betweenVertical + organisationLabelFrame.size.height
        
        positionLabelFrame.origin.y = floor((bounds.size.height - totalLabelHeights) / 2.0)
        organisationLabelFrame.origin.y = CGRectGetMaxY(positionLabelFrame) + LayoutConstants.Padding.betweenVertical
        
        positionLabel.frame = positionLabelFrame
        organisationLabel.frame = organisationLabelFrame
    }
}
