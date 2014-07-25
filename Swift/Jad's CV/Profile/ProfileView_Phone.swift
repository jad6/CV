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
            profilePictureImageView.frame.size = LayoutConstants.PictureSizes.big
            profilePictureImageView.centerHorizontallyWithReferenceView(self)
            profilePictureImageView.frame.origin.y = LayoutConstants.statusBarHeight + LayoutConstants.Padding.top
            
            nameLabel.frame.size = CGSizeCeil(nameLabel.sizeThatFits(bounds.size))
            nameLabel.centerHorizontallyWithReferenceView(self)
            nameLabel.frame.origin.y = CGRectGetMaxY(profilePictureImageView.frame) + LayoutConstants.Padding.side
            
            descriptionLabel.frame.size = CGSizeFloor(descriptionLabel.sizeThatFits(bounds.size))
            descriptionLabel.centerHorizontallyWithReferenceView(self)
            descriptionLabel.frame.origin.y = CGRectGetMaxY(nameLabel.frame) + LayoutConstants.Padding.betweenVertical
            
            emailButton.frame.size = CGSizeCeil(emailButton.sizeThatFits(bounds.size))
            emailButton.centerHorizontallyWithReferenceView(self)
            emailButton.frame.origin.y = CGRectGetMaxY(descriptionLabel.frame) + (2 * LayoutConstants.Padding.betweenVertical)
            
            phoneButton.frame.size = CGSizeCeil(phoneButton.sizeThatFits(bounds.size))
            phoneButton.centerHorizontallyWithReferenceView(self)
            phoneButton.frame.origin.y = CGRectGetMaxY(emailButton.frame) + LayoutConstants.Padding.betweenVertical
        } else {
            // This makes the buttons disppear nicely with the animations
            emailButton.frame = nameLabel.frame
            phoneButton.frame = descriptionLabel.frame
        }
        
        textView.frame.origin.y = CGRectGetMaxY(phoneButton.frame) + (4 * LayoutConstants.Padding.betweenVertical)
        textView.frame.origin.x = 0.0
        textView.frame.size.width = bounds.size.width
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
        
        fadeImageView.frame = bounds
    }
}
