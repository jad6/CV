//
//  HomeView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class HomeView: UIView {

    //MARK:- Properties

    let sectionsPageView: UIView
    let profileView = UIDevice.isPad() ? ProfileView_Pad() : ProfileView_Phone()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        self.sectionsPageView = UIView()
        super.init(coder: aDecoder)
    }

    init(sectionsPageView: UIView) {
        self.sectionsPageView = sectionsPageView
        
        super.init(frame: CGRectZero)
        
        self.addSubview(self.profileView)
        self.addSubview(sectionsPageView)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileView.frame.size.height = profileView.expanded ? bounds.size.height : profileView.length
        profileView.frame.size.width = bounds.size.width
        
        sectionsPageView.frame.size.height = bounds.size.height - ProfileView.LayoutConstants.topLayoutLength
        sectionsPageView.frame.size.width = bounds.size.width
        sectionsPageView.frame.origin.y = profileView.frame.maxY
    }
    
    //MARK: Logic
    
    func handleProfileViewFocus() {
        profileView.expanded = !profileView.expanded
        
        if profileView.expanded == true {
            profileView.backgroundImageView.blurEffectView.setHidden(true, animated: true, duration: kProfileViewAnimationDuration, completion: nil)
        }
        
        UIView.animateWithDuration(kProfileViewAnimationDuration, animations: {
            self.layoutSubviews()
            self.profileView.layoutSubviews()
            }, completion: { finished in
            if finished == true && self.profileView.expanded == false {
                self.profileView.backgroundImageView.blurEffectView.setHidden(false, animated: true, duration: Animations.Durations.Short.toRaw(), completion: nil)
            }
        })
    }
}
