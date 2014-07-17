//
//  HomeView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class HomeView: UIView {

    var sectionsPageView: UIView!
    var profileView: ProfileView!
    
    init(frame: CGRect) {
        self.profileView = (UIDevice.isPad() ? ProfileView_Pad() : ProfileView_Phone())
        
        super.init(frame: frame)
        
        self.addSubview(self.profileView)
    }

    convenience init(sectionsPageView: UIView) {
        self.init(frame: CGRectZero)
        
        self.addSubview(sectionsPageView)
        self.sectionsPageView = sectionsPageView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var profileViewFrame = profileView.frame
        profileViewFrame.size.height = (profileView.expanded) ? bounds.size.height : profileView.length
        profileViewFrame.size.width = bounds.size.width
        profileView.frame = profileViewFrame
        
        var sectionsPageViewFrame = sectionsPageView.frame
        sectionsPageViewFrame.size.height = bounds.size.height - CGRectGetMaxY(profileViewFrame)
        sectionsPageViewFrame.size.width = bounds.size.width
        sectionsPageViewFrame.origin.y = CGRectGetMaxY(profileViewFrame)
        sectionsPageView.frame = sectionsPageViewFrame
    }
    
    //-- Logic
    
    func handleProfileViewFocus() {
        profileView.expanded = !profileView.expanded

        let duration = Animations.Durations.Medium.toRaw()
        
        if profileView.expanded {
            profileView.backgroundImageView.blurEffectView.setHidden(true, animated: true, duration: duration, completion: nil)
        }
        UIView.animateWithDuration(duration, animations: {
            self.layoutSubviews()
            self.profileView.layoutSubviews()
        }, completion: { finished in
            if finished && !self.profileView.expanded {
                self.profileView.backgroundImageView.blurEffectView.setHidden(false, animated: true, duration: Animations.Durations.Short.toRaw(), completion: nil)
            }
        })
    }
}
