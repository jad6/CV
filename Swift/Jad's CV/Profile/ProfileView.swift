//
//  ProfileView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate {
    func profileViewDidSelectInfoButton(_: ProfileView)
    func profileViewDidSelectCloseButton(_: ProfileView)
}

protocol ProfileViewDataSource {
    func controllerForEmailPresentationInProfileView(_: ProfileView) -> UIViewController
}

struct LayoutConstants {
    struct ProfilePictureSizes {
        static let small = CGSizeMake(55.0, 55.0)
        static let big = CGSizeMake(144.0, 144.0)
    }
    
    struct Padding {
        static let side = 18.0
        static let betweenHorizontal = 8.0
        static let betweenVertical = 4.0
    }
    
    static let statusBarHeight = 20.0
    static let topLayoutLength = 108.0
    static var headerHeight: Double {
    return topLayoutLength - statusBarHeight
    }
}

class ProfileView: UIView, UILayoutSupport {

    var delegate: ProfileViewDelegate?
    var dataSource: ProfileViewDataSource?
    
    var backgroundImageView: BlurImageView!
    var profilePictureImageView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var infoButton: UIButton!
    var emailButton: UIButton!
    var phoneButton: UIButton!
    var textView: UITextView!
    
    var expanded: Bool {
    didSet {
        let color = (expanded) ? UIColor.blackColor() : UIColor.whiteColor()
        nameLabel.textColor = color
        descriptionLabel.textColor = color
        tintColor = color
                
        self.handleSubview(emailButton, toBeHidden: !expanded, animated: true)
        self.handleSubview(phoneButton, toBeHidden: !expanded, animated: true)
        self.handleSubview(textView, toBeHidden: !expanded, animated: true)
    }
    }
    
    var length: CGFloat {
    return LayoutConstants.topLayoutLength
    }
    
    init(frame: CGRect) {
        self.backgroundImageView = BlurImageView(blurEffectStyle: .Dark)
        self.profilePictureImageView = UIImageView()
        self.nameLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.infoButton = UIButton.buttonWithType(.InfoLight) as UIButton
        self.emailButton = UIButton()
        self.phoneButton = UIButton()
        self.textView = UITextView()
        
        self.expanded = false
        
        super.init(frame: frame)
                
        let imagePath = NSBundle.mainBundle().pathForResource("union_lake", ofType: "jpg")
        self.backgroundImageView.image = UIImage(contentsOfFile: imagePath)
        self.backgroundImageView.clipsToBounds = true
        self.backgroundImageView.contentMode = .ScaleAspectFill
        self.addSubview(self.backgroundImageView)
        
        self.profilePictureImageView.image = UIImage(named: "profile_pic")
        self.addSubview(self.profilePictureImageView)
        
        self.nameLabel.font = UIFont.helveticaNeueThinFontOfSize(21.0)
        self.nameLabel.textColor = UIColor.whiteColor()
        self.addSubview(self.nameLabel)
        
        self.nameLabel.font = UIFont.helveticaNeueLightFontOfSize(15.0)
        self.nameLabel.textColor = UIColor.whiteColor()
        self.addSubview(self.descriptionLabel)
        
        self.infoButton.tintColor = UIColor.whiteColor()
        self.addSubview(self.infoButton)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    //-- Logic 
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImageView.frame = bounds
        
        var infoButtonFrame = infoButton.frame
        infoButtonFrame.size = infoButton.sizeThatFits(CGSizeZero)
        infoButtonFrame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerHeight - infoButtonFrame.size.height) / 2.0)
        infoButtonFrame.origin.x = bounds.size.width - infoButtonFrame.size.width - LayoutConstants.Padding.side
        infoButton.frame = infoButtonFrame
        
        // When the view is not expanded the iPad and iPhone share the same layout
        if !expanded {
            var profilePictureImageViewFrame = profilePictureImageView.frame
            profilePictureImageViewFrame.size = LayoutConstants.ProfilePictureSizes.small
            profilePictureImageViewFrame.origin.x = LayoutConstants.Padding.side
            profilePictureImageViewFrame.origin.y = LayoutConstants.statusBarHeight + floor((LayoutConstants.headerHeight - profilePictureImageViewFrame.size.height) / 2.0)
            profilePictureImageView.frame = profilePictureImageViewFrame
            
            var nameLabelFrame = nameLabel.frame
            nameLabelFrame.origin.x = CGRectGetMaxX(profilePictureImageViewFrame) + LayoutConstants.Padding.betweenHorizontal
            let labelsBoundingWidth = bounds.size.width - nameLabelFrame.origin.x - infoButtonFrame.origin.x - LayoutConstants.Padding.side
            nameLabelFrame.size = nameLabel.sizeThatFits(CGSizeMake(labelsBoundingWidth, 0.0))
            
            var descriptionLabelFrame = descriptionLabel.frame
            descriptionLabelFrame.origin.x = nameLabelFrame.origin.x
            descriptionLabelFrame.size = descriptionLabel.sizeThatFits(CGSizeMake(labelsBoundingWidth, 0.0))
            
            let labelsTotoalHeights = nameLabelFrame.size.height + LayoutConstants.Padding.betweenVertical + descriptionLabelFrame.size.height
            
            nameLabelFrame.origin.y = LayoutConstants.statusBarHeight + floor((labelsTotoalHeights - LayoutConstants.headerHeight) / 2.0)
            descriptionLabelFrame.origin.y = CGRectGetMaxY(nameLabelFrame) + LayoutConstants.Padding.betweenVertical
        }
    }
    
    func handleSubview(subview: UIView, toBeHidden hide: Bool, animated: Bool) {
        if !hide {
            self.addSubview(subview)
        }
        
        subview.setHidden(hide, animated: animated, duration: Animations.Durations.Medium.toRaw()) { finished in
            if finished && hide {
                subview.removeFromSuperview()
            }
        }
    }
}
