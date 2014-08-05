//
//  CloudFormattedTextView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 5/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class CloudFormattedTextView: FormattedTextView {

    //MARK:- Properties
    
    let cloudImageResizableInsets = UIEdgeInsets(top: 80.0, left: 75.0, bottom: 80.0, right: 75.0)
    
    private let cloudImageView = UIImageView()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer!) {
        super.init(frame: frame, textContainer: textContainer)
        
        let cloudImage = UIImage(named: "ipad_fade").resizableImageWithCapInsets(cloudImageResizableInsets)
        self.cloudImageView.image = cloudImage
        self.addSubview(self.cloudImageView)
        
        self.sendSubviewToBack(self.cloudImageView)
        
        self.textContainerInset = cloudImageResizableInsets
    }
    
    //MARK:- Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cloudImageView.frame = bounds
    }
}
