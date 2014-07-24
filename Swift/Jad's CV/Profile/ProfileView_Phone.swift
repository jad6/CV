//
//  ProfileView_Phone.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ProfileView_Phone: ProfileView {
    
    private var fadeImageView: UIImageView!
    
    override var expanded: Bool {
    didSet {
        handleSubview(fadeImageView, insertedAboveSubview: backgroundImageView, toBeHidden: !expanded, animated: true)
    }
    }
    
    init(frame: CGRect) {
        let fadeImage = UIImage(named: "fade_up").resizableImageWithCapInsets(UIEdgeInsetsMake(263.0, 0.0, 0.0, 0.0))
        self.fadeImageView = UIImageView(image: fadeImage)
        super.init(frame: frame)
        
        self.textView.textContainerInset = UIEdgeInsetsMake(0.0, 20, 0.0, 20)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if expanded {
            var profilePictureImageViewFrame = profilePictureImageView.frame
            profilePictureImageViewFrame.size = LayoutConstants.PictureSizes.big
            profilePictureImageViewFrame.origin.x = floor((bounds.size.width - profilePictureImageViewFrame.size.width) / 2.0)
            profilePictureImageViewFrame.origin.y = LayoutConstants.statusBarHeight + LayoutConstants.Padding.top
            profilePictureImageView.frame = profilePictureImageViewFrame
            
            var nameLabelFrame = nameLabel.frame
            nameLabelFrame.size = CGSizeCeil(nameLabel.sizeThatFits(bounds.size))
            nameLabelFrame.origin.x = floor((bounds.size.width - nameLabelFrame.size.width) / 2.0)
            nameLabelFrame.origin.y = CGRectGetMaxY(profilePictureImageViewFrame) + LayoutConstants.Padding.side
            nameLabel.frame = nameLabelFrame
            
            var descriptionLabelFrame = descriptionLabel.frame
            descriptionLabelFrame.size = CGSizeFloor(descriptionLabel.sizeThatFits(bounds.size))
            descriptionLabelFrame.origin.x = floor((bounds.size.width - descriptionLabelFrame.size.width) / 2.0)
            descriptionLabelFrame.origin.y = CGRectGetMaxY(nameLabelFrame) + LayoutConstants.Padding.betweenVertical
            descriptionLabel.frame = descriptionLabelFrame
            
            var emailButtonFrame = emailButton.frame
            emailButtonFrame.size = CGSizeCeil(emailButton.sizeThatFits(bounds.size))
            emailButtonFrame.origin.x = floor((bounds.size.width - emailButtonFrame.size.width) / 2.0)
            emailButtonFrame.origin.y = CGRectGetMaxY(descriptionLabelFrame) + (2 * LayoutConstants.Padding.betweenVertical)
            emailButton.frame = emailButtonFrame
            
            var phoneButtonFrame = phoneButton.frame
            phoneButtonFrame.size = CGSizeCeil(phoneButton.sizeThatFits(bounds.size))
            phoneButtonFrame.origin.x = floor((bounds.size.width - phoneButtonFrame.size.width) / 2.0)
            phoneButtonFrame.origin.y = CGRectGetMaxY(emailButtonFrame) + LayoutConstants.Padding.betweenVertical
            phoneButton.frame = phoneButtonFrame
        } else {
            // This makes the buttons disppear nicely with the animations
            emailButton.frame = nameLabel.frame
            phoneButton.frame = descriptionLabel.frame
        }
        
        var textViewFrame = textView.frame
        textViewFrame.origin.y = CGRectGetMaxY(phoneButton.frame) + (4 * LayoutConstants.Padding.betweenVertical)
        textViewFrame.origin.x = 0.0
        textViewFrame.size.width = bounds.size.width
        textViewFrame.size.height = bounds.size.height - textViewFrame.origin.y
        textView.frame = textViewFrame
        
        fadeImageView.frame = bounds
    }
}
