//
//  FormattedTextView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 19/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class FormattedTextView: UITextView {
    
    init(frame: CGRect, textContainer: NSTextContainer!) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.editable = false
        self.textAlignment = .Center
    }
}
