//
//  EducationView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationView: DynamicTypeView {
    
    //MARK:- Constants
    
    struct LayoutConstants {
        struct Padding {
            static let side: CGFloat = 15.0
            static let top: CGFloat = 15.0
            static let betweenHorizontal: CGFloat = 8.0
            static let betweenVertical: CGFloat = 2.0
        }
        
        static let imageViewSize = CGSize(width: 70.0, height: 70.0)
    }
    
    //MARK:- Properties
    
    let universityLogoImageView = UIImageView()
    let textView = FormattedTextView()
    let establishmentLabel = UILabel()
    let statusLabel = UILabel()
    let completionDateLabel = UILabel()
    let backgroundImageView = UIImageView()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.universityLogoImageView)
        self.addSubview(self.completionDateLabel)
        self.addSubview(self.textView)
        
        self.establishmentLabel.numberOfLines = 2
        self.addSubview(self.establishmentLabel)
        
        self.statusLabel.numberOfLines = 3
        self.addSubview(self.statusLabel)
        
        self.backgroundImageView.contentMode = .ScaleAspectFill
        self.backgroundImageView.clipsToBounds = true
        
        self.backgroundColor = UIColor.whiteColor()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    //MARK:- Dynamic type
    
    override func reloadDynamicTypeContent() {
        textView.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleBody)
        establishmentLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        statusLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        completionDateLabel.font = DynamicTypeFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
    }
}
