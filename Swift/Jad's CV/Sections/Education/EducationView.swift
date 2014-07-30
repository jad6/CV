//
//  EducationView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationView: UIView {
    struct LayoutConstants {
        struct Padding {
            static let side: CGFloat = 15.0
            static let top: CGFloat = 15.0
            static let betweenHorizontal: CGFloat = 8.0
            static let betweenVertical: CGFloat = 2.0
        }
        
        static let imageViewSize = CGSize(width: 70.0, height: 70.0)
    }
        
    private(set) var universityLogoImageView: UIImageView!
    private(set) var textView: FormattedTextView!
    private(set) var establishmentLabel: UILabel!
    private(set) var statusLabel: UILabel!
    private(set) var completionDateLabel: UILabel!
    private(set) var backgroundImageView: UIImageView!
    
    init(frame: CGRect) {
        self.universityLogoImageView = UIImageView()
        self.textView = FormattedTextView()
        self.establishmentLabel = UILabel()
        self.statusLabel = UILabel()
        self.completionDateLabel = UILabel()
        self.backgroundImageView = UIImageView()
        
        super.init(frame: frame)
        
        self.addSubview(self.universityLogoImageView)

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
        
        self.backgroundColor = UIColor.whiteColor()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
}
