//
//  TimelineTableBackgroundView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 24/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineTableBackgroundView: UIView {

    //MARK:- Properties

    let lineView = UIView()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.lineView.backgroundColor = UIColor.timelineGrayColor()
        self.addSubview(lineView)
    }
    
    convenience override init() {
        self.init(frame: CGRectZero)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineView.frame.size.height = bounds.size.height
    }
}
