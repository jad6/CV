//
//  ProfileView_Pad.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ProfileView_Pad: ProfileView {
    
    //MARK:- Constants
    
    private struct LayoutConstants_Pad {
        static let textViewMaxSize = CGSize(width: 480.0, height: 480.0)
    }
    
    //MARK:- Properties
    
    private var cloudTextView: CloudFormattedTextView {
    return textView as CloudFormattedTextView
    }

    override var expanded: Bool {
    didSet {
        handleSubview(cloudTextView, insertedAboveSubview: backgroundImageView, toBeHidden: !expanded, animated: true)
    }
    }
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cloudTextView.frame.size = cloudTextView.sizeThatFits(LayoutConstants_Pad.textViewMaxSize).ceilSize
        
        if expanded == true {
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
            emailButton.frame = cloudTextView.frame
            phoneButton.frame = cloudTextView.frame
        }
        
        cloudTextView.textContainerInset.top = cloudTextView.cloudImageResizableInsets.top + (phoneButton.frame.maxY - emailButton.frame.minY) + (2 * LayoutConstants.Padding.betweenVertical)
        
        cloudTextView.frame.origin.y = descriptionLabel.frame.maxY
        cloudTextView.centerHorizontallyWithReferenceRect(self.bounds)
    }
}
