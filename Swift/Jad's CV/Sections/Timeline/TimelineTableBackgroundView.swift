//
//  TimelineTableBackgroundView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineTableBackgroundView: UIView {

    private(set) var lineView: UIView!
    
    init(frame: CGRect) {
        self.lineView = UIView()
        
        super.init(frame: frame)

        self.lineView.backgroundColor = UIColor.backgroundGrayColor()
        self.addSubview(lineView)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineView.frame.size.height = bounds.size.height
    }
}
