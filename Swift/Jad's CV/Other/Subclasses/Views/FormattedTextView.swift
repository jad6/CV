//
//  FormattedTextView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 19/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class FormattedTextView: UITextView {
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer!) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.editable = false
        self.textAlignment = .Center
        self.backgroundColor = UIColor.clearColor()
        self.dataDetectorTypes = .All
    }
    
    convenience override init() {
        self.init(frame: CGRectZero, textContainer: nil)
    }
}
