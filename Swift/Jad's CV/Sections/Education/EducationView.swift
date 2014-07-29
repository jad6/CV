//
//  EducationView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationView: UIView {
    
    
    private(set) var textView: FormattedTextView!
    private(set) var establishmentLabel: UILabel!
    private(set) var statusLabel: UILabel!
    private(set) var completionDateLabel: UILabel!
    private(set) var backgroundImageView: UIImageView!
    private(set) var fadeImageView: UIImageView!
    
    init(frame: CGRect) {
        self.textView = FormattedTextView()
        self.establishmentLabel = UILabel()
        self.statusLabel = UILabel()
        self.completionDateLabel = UILabel()
        self.fadeImageView = UIImageView()
        
        super.init(frame: frame)

        self.textView.font = CVFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.addSubview(self.textView)
        
        self.establishmentLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.establishmentLabel.numberOfLines = 2
        self.addSubview(self.establishmentLabel)
        
        self.statusLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.statusLabel.numberOfLines = 3
        self.addSubview(self.statusLabel)
        
        self.completionDateLabel.font = CVFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        self.addSubview(self.completionDateLabel)
        
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
