//
//  BlurImageView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class BlurImageView: UIImageView {
    
    var blurEffectView: UIVisualEffectView!
    
    init(blurEffectStyle: UIBlurEffectStyle) {
        self.blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: blurEffectStyle))

        super.init(frame: CGRectZero)

        self.addSubview(self.blurEffectView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurEffectView.frame = bounds
    }
}
