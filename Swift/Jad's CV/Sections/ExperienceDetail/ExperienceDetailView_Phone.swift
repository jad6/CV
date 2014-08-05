//
//  ExperienceDetailView_Pad.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 4/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailView_Phone: ExperienceDetailView {
    
    //MARK:- Constants
    
    private struct LayoutConstants_Phone {
        static let backButtonSize = CGSize(width: 48.0, height: 44.0)
    }
    
    //MARK:- Properties
    
    let backButton = UIButton()
    
    //MARK:- Init

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let backImage = UIImage(named: "back")
        self.backButton.setImage(backImage, forState: .Normal)
        self.backButton.contentMode = .ScaleAspectFit
        self.backButton.frame.size = LayoutConstants_Phone.backButtonSize
        self.addSubview(self.backButton)
    }
}
