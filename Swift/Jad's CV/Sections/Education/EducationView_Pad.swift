//
//  EducationView_Pad.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 28/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationView_Pad: EducationView {

    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.backgroundImageView)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImageView.frame = bounds
    }
}
