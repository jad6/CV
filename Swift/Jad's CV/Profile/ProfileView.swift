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
            static let small = CGSize(width: 54.0, height: 54.0)
            static let big = CGSize(width: 108.0, height: 108.0)
        }
        
        struct Padding {
            static let side: CGFloat = 18.0
            static let top: CGFloat = 20.0
            static let bottom: CGFloat = 10.0
            static let betweenHorizontal: CGFloat = 8.0
            static let betweenVertical: CGFloat = 4.0
        }
        
        static let textViewMaxSize = CGSize(width: 320.0, height: 480.0)
        static let statusBarHeight: CGFloat = 20.0
        static let topLayoutLength: CGFloat = 108.0
        
        static func headerFrameInView(view: UIView) -> CGRect {
            return CGRect(x: 0.0, y: statusBarHeight, width: view.frame.width, height: topLayoutLength - statusBarHeight)
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
        let color = self.expanded ? UIColor.blackColor() : UIColor.whiteColor()

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
        self.emailButton.setTitleColor((UIDevice.canEmail() ? UIColor.defaultBlueColor() : UIColor.darkGrayColor()), forState: .Normal)
        
        self.phoneButton.titleLabel.font = UIFont.helveticaNeueFontOfSize(15.0)
        self.phoneButton.setTitleColor((UIDevice.canCall() ? UIColor.defaultBlueColor() : UIColor.darkGrayColor()), forState: .Normal)
        
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
            infoButton.frame.size = infoButton.sizeThatFits(CGSizeZero).ceilSize
            infoButton.frame.origin.y = infoButton.verticalCenterWithReferenceFrame(LayoutConstants.headerFrameInView(self))
            infoButton.frame.origin.x = bounds.size.width - infoButton.frame.size.width - LayoutConstants.Padding.side
            
            profilePictureImageView.frame.size = LayoutConstants.PictureSizes.small
            profilePictureImageView.frame.origin.x = LayoutConstants.Padding.side
            profilePictureImageView.frame.origin.y = profilePictureImageView.verticalCenterWithReferenceFrame(LayoutConstants.headerFrameInView(self))
            
            nameLabel.frame.origin.x = profilePictureImageView.frame.maxX + LayoutConstants.Padding.betweenHorizontal
            let labelsBoundingWidth = bounds.size.width - nameLabel.frame.origin.x - LayoutConstants.Padding.betweenHorizontal - infoButton.frame.size.width - LayoutConstants.Padding.side
            nameLabel.frame.size = nameLabel.sizeThatFits(CGSize(width: labelsBoundingWidth, height: 0.0)).ceilSize
            
            descriptionLabel.frame.origin.x = nameLabel.frame.origin.x
            descriptionLabel.frame.size = descriptionLabel.sizeThatFits(CGSize(width: labelsBoundingWidth, height: 0.0)).ceilSize
            
            let labelsTotoalHeights = nameLabel.frame.size.height + LayoutConstants.Padding.betweenVertical + descriptionLabel.frame.size.height
            
            nameLabel.frame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerFrameInView(self).height - labelsTotoalHeights) / 2.0)
            descriptionLabel.frame.origin.y = nameLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
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
