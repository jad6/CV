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

    private var tipsView: TipsView?
    
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
        
        if tipsView != nil {
            tipsView!.frame = bounds
        }
    }
    
    //MARK:- Tips
    
    func handleTipsView() {
        if tipsView == nil {
            tipsView = TipsView(frame: bounds)
            tipsView!.hidden = true
            
            self.addSubview(tipsView!)
            
            tipsView!.setHidden(false, animated: true, duration: Animations.Durations.Medium.toRaw(), completion: nil)
        } else {
            tipsView!.setHidden(true, animated: true, duration: Animations.Durations.Medium.toRaw()) { (finished: Bool) in
                self.tipsView!.removeFromSuperview()
                self.tipsView = nil
            }
        }
    }
    
    //MARK:- Logic
    
    func handleProfileViewFocus() {
        profileView.expanded = !profileView.expanded
        
        if profileView.expanded == true {
            profileView.backgroundImageView.blurEffectView.setHidden(true, animated: true, duration: kProfileViewAnimationDuration, completion: nil)
        }
        
        UIView.animateWithDuration(kProfileViewAnimationDuration, animations: {
            self.layoutSubviews()
            self.profileView.layoutSubviews()
            }, completion: { (finished: Bool) in
            if finished == true && self.profileView.expanded == false {
                self.profileView.backgroundImageView.blurEffectView.setHidden(false, animated: true, duration: Animations.Durations.Short.toRaw(), completion: nil)
            }
        })
    }
}
