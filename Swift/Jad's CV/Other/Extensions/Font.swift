//
//  Font.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

let CVFontTextStyleRésuméHolderName = "CVFontTextStyleRésuméHolderName"

class CVFont: UIFont {
    
    //TODO: re-enable that once Swift supports class variables
    //    private class var filePathForResource: String?
    class func ΔFontSize() -> CGFloat {
        return 2.0
    }
    
    private class func largeFontSizeForTextStyle(style: String) -> CGFloat {
        if style == CVFontTextStyleRésuméHolderName {
            return 21.0
        }
        
        return 15.0
    }
    
    private class func fontSizeForTextStyle(style: String) -> CGFloat {
        let contentSizeCategory = UIApplication.sharedApplication().preferredContentSizeCategory
        
        let largeFontSize = largeFontSizeForTextStyle(style)
        
        if contentSizeCategory == UIContentSizeCategoryExtraSmall {
            return largeFontSize - (3 * ΔFontSize())
        } else if contentSizeCategory == UIContentSizeCategorySmall {
            return largeFontSize - (2 * ΔFontSize())
        } else if contentSizeCategory == UIContentSizeCategoryMedium {
            return largeFontSize - ΔFontSize()
        } else if contentSizeCategory == UIContentSizeCategoryLarge {
            return largeFontSize
        } else if contentSizeCategory == UIContentSizeCategoryExtraLarge {
            return largeFontSize + ΔFontSize()
        } else if contentSizeCategory == UIContentSizeCategoryExtraExtraLarge {
            return largeFontSize + (2 * ΔFontSize())
        } else if contentSizeCategory == UIContentSizeCategoryExtraExtraExtraLarge {
            return largeFontSize + (3 * ΔFontSize())
        }
        
        return 0.0
    }
    
    class func preferredFontForRésuméHolderName(#fontSize: CGFloat) -> UIFont {
        let headlineFontDescriptor = UIFontDescriptor(name: "Helvetica Neue", size: 0.0)
        let thinHeadlineFontDescriptor = headlineFontDescriptor.fontDescriptorByAddingAttributes([UIFontDescriptorNameAttribute: "Thin"])
        return UIFont(descriptor: thinHeadlineFontDescriptor, size: fontSize)
    }
    
    class func preferredFontForTextStyle(style: String, fontSize: CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(style)
        return UIFont(descriptor: descriptor, size: fontSize)
    }
    
    override class func preferredFontForTextStyle(style: String!) -> UIFont! {
        let size = fontSizeForTextStyle(style)

        if style == CVFontTextStyleRésuméHolderName {
            return preferredFontForRésuméHolderName(fontSize: size)
        } else {
            return preferredFontForTextStyle(style, fontSize: size)
        }
    }
}