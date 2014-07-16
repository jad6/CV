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
        
        self.profileView.backgroundColor = UIColor.greenColor()
        self.sectionsPageView.backgroundColor = UIColor.redColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var profileViewFrame = profileView.frame
        profileViewFrame.size.height = profileView.length
        profileViewFrame.size.width = bounds.size.width
        profileView.frame = profileViewFrame
        
        var sectionsPageViewFrame = sectionsPageView.frame
        sectionsPageViewFrame.size.height = bounds.size.height - profileView.length
        sectionsPageViewFrame.size.width = bounds.size.width
        sectionsPageViewFrame.origin.y = profileView.length
        sectionsPageView.frame = sectionsPageViewFrame
    }
}
