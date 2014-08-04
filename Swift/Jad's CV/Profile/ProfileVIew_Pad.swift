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
    private struct CloudImageLayout {
        static let resizableInsets = UIEdgeInsets(top: 80.0, left: 75.0, bottom: 80.0, right: 75.0)
    }
    
    private var cloudImageView: UIImageView!

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
        
        textView.frame.size = textView.sizeThatFits(LayoutConstants.textViewMaxSize).ceilSize
        
        if expanded {
            profilePictureImageView.frame.size = LayoutConstants.PictureSizes.big
            profilePictureImageView.centerHorizontallyWithReferenceRect(self.bounds)
            
            nameLabel.frame.size = nameLabel.sizeThatFits(bounds.size).ceilSize
            nameLabel.centerHorizontallyWithReferenceRect(self.bounds)
            
            descriptionLabel.frame.size = descriptionLabel.sizeThatFits(bounds.size).ceilSize
            descriptionLabel.centerHorizontallyWithReferenceRect(self.bounds)
            
            emailButton.frame.size = emailButton.sizeThatFits(bounds.size).ceilSize
            emailButton.centerHorizontallyWithReferenceRect(self.bounds)
            
            phoneButton.frame.size = phoneButton.sizeThatFits(bounds.size).ceilSize
            phoneButton.centerHorizontallyWithReferenceRect(self.bounds)
            
            let fadeContentTopPadding = 16 * LayoutConstants.Padding.betweenVertical
            
            profilePictureImageView.frame.origin.y = floor(bounds.size.height / 6.0)
            nameLabel.frame.origin.y = profilePictureImageView.frame.maxY + LayoutConstants.Padding.side
            descriptionLabel.frame.origin.y = nameLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
            emailButton.frame.origin.y = descriptionLabel.frame.maxY + fadeContentTopPadding
            phoneButton.frame.origin.y = emailButton.frame.maxY
        } else {
            // This makes the buttons disppear nicely with the animations
            emailButton.frame = nameLabel.frame
            phoneButton.frame = descriptionLabel.frame
        }
        
        textView.frame.origin.y = phoneButton.frame.maxY + (4 * LayoutConstants.Padding.betweenVertical)
        textView.centerHorizontallyWithReferenceRect(self.bounds)
        
        cloudImageView.frame.size.width = max(max(emailButton.frame.size.width, phoneButton.frame.size.width), textView.frame.size.width) + CloudImageLayout.resizableInsets.left + CloudImageLayout.resizableInsets.right
        cloudImageView.frame.size.height = phoneButton.frame.size.height + emailButton.frame.size.height + textView.frame.size.height + (5 * LayoutConstants.Padding.betweenVertical) + CloudImageLayout.resizableInsets.top + CloudImageLayout.resizableInsets.bottom
        let widestCloudView = widestView(views: [emailButton, phoneButton, textView])
        cloudImageView.frame.origin.x = widestCloudView.frame.origin.x - CloudImageLayout.resizableInsets.left
        cloudImageView.frame.origin.y = emailButton.frame.origin.y - CloudImageLayout.resizableInsets.top
    }
}
