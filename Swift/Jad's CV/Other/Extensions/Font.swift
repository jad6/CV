//
//  Font.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

extension UIFont {
    struct FontDescriptorSingletons {
        struct HelveticaNeue {
            static let base: UIFontDescriptor = UIFontDescriptor(name: "Helvetica Neue", size: 0.0)
            static let light: UIFontDescriptor = base.fontDescriptorByAddingAttributes([UIFontDescriptorNameAttribute: "Light"]);
            static let thin: UIFontDescriptor = base.fontDescriptorByAddingAttributes([UIFontDescriptorNameAttribute: "Thin"]);
        }
    }
    
    class func helveticaNeueLightFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(descriptor: FontDescriptorSingletons.HelveticaNeue.light, size: fontSize)
    }
    
    class func helveticaNeueThinFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(descriptor: FontDescriptorSingletons.HelveticaNeue.thin, size: fontSize)
    }
}