//
//  ExperienceDetailView_Pad.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 4/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceDetailView_Phone: ExperienceDetailView {
    private struct LayoutConstants {
        static let backButtonSize = CGSize(width: 48.0, height: 44.0)
    }
    
    private(set) var backButton: UIButton!
    
    init(frame: CGRect) {
        
        self.backButton = UIButton()
        
        super.init(frame: frame)

        let backImage = UIImage(named: "back")
        self.backButton.setImage(backImage, forState: .Normal)
        self.backButton.contentMode = .ScaleAspectFit
        self.backButton.frame.size = LayoutConstants.backButtonSize
        self.addSubview(self.backButton)
    }
}
