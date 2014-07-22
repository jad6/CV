//
//  ProfileView_Pad.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ProfileView_Pad: ProfileView {

    //TODO: when class variables are allowed make this one.
    struct CloudImageLayout {
        static let resizableInsets = UIEdgeInsetsMake(80.0, 75.0, 80.0, 75.0)
    }
    
    var cloudImageView: UIImageView!

    override var expanded: Bool {
    didSet {
        handleSubview(cloudImageView, insertedAboveSubview: backgroundImageView, toBeHidden: !expanded, animated: true)
    }
    }
    
    init(frame: CGRect) {
        let cloudImage = UIImage(named: "ipad_fade").resizableImageWithCapInsets(CloudImageLayout.resizableInsets)
        self.cloudImageView = UIImageView(image: cloudImage)
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var textViewFrame = textView.frame
        textViewFrame.size = CGSizeFloor(textView.sizeThatFits(LayoutConstants.textViewMaxSize))
        
        if expanded {
            var profilePictureImageViewFrame = profilePictureImageView.frame
            profilePictureImageViewFrame.size = LayoutConstants.PictureSizes.big
            profilePictureImageViewFrame.origin.x = floor((bounds.size.width - profilePictureImageViewFrame.size.width) / 2.0)
            
            var nameLabelFrame = nameLabel.frame
            nameLabelFrame.size = CGSizeFloor(nameLabel.sizeThatFits(bounds.size))
            nameLabelFrame.origin.x = floor((bounds.size.width - nameLabelFrame.size.width) / 2.0)
            
            var descriptionLabelFrame = descriptionLabel.frame
            descriptionLabelFrame.size = CGSizeFloor(descriptionLabel.sizeThatFits(bounds.size))
            descriptionLabelFrame.origin.x = floor((bounds.size.width - descriptionLabelFrame.size.width) / 2.0)
            
            var emailButtonFrame = emailButton.frame
            emailButtonFrame.size = CGSizeFloor(emailButton.sizeThatFits(bounds.size))
            emailButtonFrame.origin.x = floor((bounds.size.width - emailButtonFrame.size.width) / 2.0)
            
            var phoneButtonFrame = phoneButton.frame
            phoneButtonFrame.size = CGSizeFloor(phoneButton.sizeThatFits(bounds.size))
            phoneButtonFrame.origin.x = floor((bounds.size.width - phoneButtonFrame.size.width) / 2.0)
            
            let fadeContentTopPadding = 16 * LayoutConstants.Padding.betweenVertical
            
            profilePictureImageViewFrame.origin.y = floor(bounds.size.height / 6.0)
            nameLabelFrame.origin.y = CGRectGetMaxY(profilePictureImageViewFrame) + LayoutConstants.Padding.side
            descriptionLabelFrame.origin.y = CGRectGetMaxY(nameLabelFrame) + LayoutConstants.Padding.betweenVertical
            emailButtonFrame.origin.y = CGRectGetMaxY(descriptionLabelFrame) + fadeContentTopPadding
            phoneButtonFrame.origin.y = CGRectGetMaxY(emailButtonFrame) + LayoutConstants.Padding.betweenVertical

            profilePictureImageView.frame = profilePictureImageViewFrame
            nameLabel.frame = nameLabelFrame
            descriptionLabel.frame = descriptionLabelFrame
            emailButton.frame = emailButtonFrame
            phoneButton.frame = phoneButtonFrame
        } else {
            // This makes the buttons disppear nicely with the animations
            emailButton.frame = nameLabel.frame
            phoneButton.frame = descriptionLabel.frame
        }
        
        textViewFrame.origin.y = CGRectGetMaxY(phoneButton.frame) + (4 * LayoutConstants.Padding.betweenVertical)
        textViewFrame.origin.x = floor((bounds.size.width - textViewFrame.size.width) / 2.0)
        textView.frame = textViewFrame
        
        var cloudImageViewFrame = cloudImageView.frame
        cloudImageViewFrame.size.width = max(max(emailButton.frame.size.width, phoneButton.frame.size.width), textViewFrame.size.width) + CloudImageLayout.resizableInsets.left + CloudImageLayout.resizableInsets.right
        cloudImageViewFrame.size.height = phoneButton.frame.size.height + emailButton.frame.size.height + textViewFrame.size.height + (5 * LayoutConstants.Padding.betweenVertical) + CloudImageLayout.resizableInsets.top + CloudImageLayout.resizableInsets.bottom
        let widestCloudView = widestView(views: [emailButton, phoneButton, textView])
        cloudImageViewFrame.origin.x = widestCloudView.frame.origin.x - CloudImageLayout.resizableInsets.left
        cloudImageViewFrame.origin.y = emailButton.frame.origin.y - CloudImageLayout.resizableInsets.top
        cloudImageView.frame = cloudImageViewFrame
    }
    
    //MARK: Logic 
    
    func widestView(#views: [UIView]) -> UIView {
        var widestView = UIView(frame: CGRectZero)
        for view in views {
            if widestView.frame.size.width < view.frame.size.width {
                widestView = view
            }
        }
        return widestView
    }
}
