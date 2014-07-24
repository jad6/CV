//
//  ProfileView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

let kProfileViewAnimationDuration = Animations.Durations.Medium.toRaw()

class ProfileView: UIView, UILayoutSupport {
    struct LayoutConstants {
        struct PictureSizes {
            static let small = CGSizeMake(54.0, 54.0)
            static let big = CGSizeMake(108.0, 108.0)
        }
        
        struct Padding {
            static let side: CGFloat = 18.0
            static let top: CGFloat = 20.0
            static let bottom: CGFloat = 10.0
            static let betweenHorizontal: CGFloat = 8.0
            static let betweenVertical: CGFloat = 4.0
        }
        
        static let textViewMaxSize = CGSizeMake(320.0, 480.0)
        static let statusBarHeight: CGFloat = 20.0
        static let topLayoutLength: CGFloat = 108.0
        static var headerHeight: CGFloat {
        return topLayoutLength - statusBarHeight
        }
    }
    
    private(set) var backgroundImageView: BlurImageView!
    private(set) var profilePictureImageView: UIImageView!
    private(set) var nameLabel: UILabel!
    private(set) var descriptionLabel: UILabel!
    private(set) var infoButton: UIButton!
    private(set) var emailButton: UIButton!
    private(set) var phoneButton: UIButton!
    private(set) var textView: UITextView!
    
    var expanded: Bool {
    didSet {
        let color = (self.expanded) ? UIColor.blackColor() : UIColor.whiteColor()

        UIView.animateWithDuration(kProfileViewAnimationDuration) {
            self.infoButton.tintColor = color
        }
        nameLabel.textColor = color
        descriptionLabel.textColor = color
    
        handleSubview(emailButton, toBeHidden: !expanded, animated: true)
        handleSubview(phoneButton, toBeHidden: !expanded, animated: true)
        handleSubview(textView, toBeHidden: !expanded, animated: true)
    }
    }
    
    var length: CGFloat {
    return LayoutConstants.topLayoutLength
    }
    
    init(frame: CGRect) {
        self.backgroundImageView = BlurImageView(blurEffectStyle: .Light)
        self.nameLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.infoButton = UIButton.buttonWithType(.InfoLight) as UIButton
        self.emailButton = UIButton()
        self.phoneButton = UIButton()
        self.textView = FormattedTextView()
        self.profilePictureImageView = UIImageView()
        
        self.expanded = false
        
        super.init(frame: frame)
                
        self.backgroundImageView.clipsToBounds = true
        self.backgroundImageView.contentMode = .ScaleAspectFill
        self.addSubview(self.backgroundImageView)
        
        self.nameLabel.font = UIFont.helveticaNeueThinFontOfSize(21.0)
        self.nameLabel.textColor = UIColor.whiteColor()
        self.addSubview(self.nameLabel)
        
        self.descriptionLabel.font = UIFont.helveticaNeueLightFontOfSize(15.0)
        self.descriptionLabel.textColor = UIColor.whiteColor()
        self.addSubview(self.descriptionLabel)
        
        self.infoButton.tintColor = UIColor.whiteColor()
        self.addSubview(self.infoButton)
        
        self.profilePictureImageView.image = UIImage(named: "profile_pic")
        self.addSubview(self.profilePictureImageView)
        
        self.emailButton.titleLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.emailButton.setTitleColor(UIColor.defaultBlueColor(), forState: .Normal)
        
        self.phoneButton.titleLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.phoneButton.setTitleColor(UIColor.defaultBlueColor(), forState: .Normal)
        
        self.textView.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.textView.backgroundColor = UIColor.clearColor()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImageView.frame = bounds
        
        // When the view is not expanded the iPad and iPhone share the same layout
        if !expanded {
            var infoButtonFrame = infoButton.frame
            infoButtonFrame.size = CGSizeCeil(infoButton.sizeThatFits(CGSizeZero))
            infoButtonFrame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerHeight - infoButtonFrame.size.height) / 2.0)
            infoButtonFrame.origin.x = bounds.size.width - infoButtonFrame.size.width - LayoutConstants.Padding.side
            infoButton.frame = infoButtonFrame
            
            var profilePictureImageViewFrame = profilePictureImageView.frame
            profilePictureImageViewFrame.size = LayoutConstants.PictureSizes.small
            profilePictureImageViewFrame.origin.x = LayoutConstants.Padding.side
            profilePictureImageViewFrame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerHeight - profilePictureImageViewFrame.size.height) / 2.0)
            profilePictureImageView.frame = profilePictureImageViewFrame
            
            var nameLabelFrame = nameLabel.frame
            nameLabelFrame.origin.x = CGRectGetMaxX(profilePictureImageViewFrame) + LayoutConstants.Padding.betweenHorizontal
            let labelsBoundingWidth = bounds.size.width - nameLabelFrame.origin.x - LayoutConstants.Padding.betweenHorizontal - infoButtonFrame.size.width - LayoutConstants.Padding.side
            nameLabelFrame.size = CGSizeCeil(nameLabel.sizeThatFits(CGSizeMake(labelsBoundingWidth, 0.0)))
            
            var descriptionLabelFrame = descriptionLabel.frame
            descriptionLabelFrame.origin.x = nameLabelFrame.origin.x
            descriptionLabelFrame.size = CGSizeCeil(descriptionLabel.sizeThatFits(CGSizeMake(labelsBoundingWidth, 0.0)))
            
            let labelsTotoalHeights = nameLabelFrame.size.height + LayoutConstants.Padding.betweenVertical + descriptionLabelFrame.size.height
            
            nameLabelFrame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerHeight - labelsTotoalHeights) / 2.0)
            descriptionLabelFrame.origin.y = CGRectGetMaxY(nameLabelFrame) + LayoutConstants.Padding.betweenVertical
            
            nameLabel.frame = nameLabelFrame
            descriptionLabel.frame = descriptionLabelFrame
        }
    }
    
    //MARK: Logic
    
    func handleSubview(subview: UIView, insertedAboveSubview bewlowSubview: UIView?, toBeHidden hide: Bool, animated: Bool) {
        if !hide {
            if bewlowSubview {
                self.insertSubview(subview, aboveSubview: bewlowSubview!)
            } else {
                self.addSubview(subview)
            }
        }
        
        subview.setHidden(hide, animated: animated, duration: kProfileViewAnimationDuration) { finished in
            if finished && hide {
                subview.removeFromSuperview()
            }
        }
    }
    
    func handleSubview(subview: UIView, toBeHidden hide: Bool, animated: Bool) {
        self.handleSubview(subview, insertedAboveSubview: nil, toBeHidden: hide, animated: animated)
    }
}
