//
//  ProfileView_Phone.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ProfileView_Phone: ProfileView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var infoButtonFrame = infoButton.frame
        infoButtonFrame.size = infoButton.sizeThatFits(CGSizeZero)
        infoButtonFrame.origin.y = floor((bounds.size.height - infoButtonFrame.size.height) / 2.0)
        infoButtonFrame.origin.x = bounds.size.width - infoButtonFrame.size.width - 18.0
        infoButton.frame = infoButtonFrame
        
        
    }
}
