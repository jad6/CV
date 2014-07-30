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
        let fadeImage = UIImage(named: "fade_up").resizableImageWithCapInsets(UIEdgeInsets(top: 260.0, left: 0.0, bottom: 0.0, right: 0.0))
        self.fadeImageView = UIImageView(image: fadeImage)
        super.init(frame: frame)
        
        self.textView.textContainerInset = UIEdgeInsets(top: 0.0, left: 20, bottom: 0.0, right: 20)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if expanded {
            profilePictureImageView.frame.size = LayoutConstants.PictureSizes.big
            profilePictureImageView.centerHorizontallyWithReferenceView(self)
            profilePictureImageView.frame.origin.y = LayoutConstants.statusBarHeight + LayoutConstants.Padding.top
            
            nameLabel.frame.size = nameLabel.sizeThatFits(bounds.size).ceilSize
            nameLabel.centerHorizontallyWithReferenceView(self)
            nameLabel.frame.origin.y = profilePictureImageView.frame.maxY + LayoutConstants.Padding.side
            
            descriptionLabel.frame.size = descriptionLabel.sizeThatFits(bounds.size).ceilSize
            descriptionLabel.centerHorizontallyWithReferenceView(self)
            descriptionLabel.frame.origin.y = nameLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
            
            emailButton.frame.size = emailButton.sizeThatFits(bounds.size).ceilSize
            emailButton.centerHorizontallyWithReferenceView(self)
            emailButton.frame.origin.y = descriptionLabel.frame.maxY + (2 * LayoutConstants.Padding.betweenVertical)
            
            phoneButton.frame.size = phoneButton.sizeThatFits(bounds.size).ceilSize
            phoneButton.centerHorizontallyWithReferenceView(self)
            phoneButton.frame.origin.y = emailButton.frame.maxY
        } else {
            // This makes the buttons disppear nicely with the animations
            emailButton.frame = nameLabel.frame
            phoneButton.frame = descriptionLabel.frame
        }
        
        textView.frame.origin.y = phoneButton.frame.maxY + (4 * LayoutConstants.Padding.betweenVertical)
        textView.frame.origin.x = 0.0
        textView.frame.size.width = bounds.size.width
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
        
        fadeImageView.frame = bounds
    }
}
