//
//  Font.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

let CVFontTextStyleRésuméHolderName = "CVFontTextStyleRésuméHolderName"
let CVFontTextStyleCaption2Italic = "CVFontTextStyleCaption2Italic"
let CVFontTextStyleTimelineDate = "CVFontTextStyleTimelineDate"

class CVFont: UIFont {
    private struct Constants {
        static let ΔFontSize: CGFloat = 2.0
        static let largeFontSize: CGFloat = 15.0
        
        static let résuméHolderNameLargeFontSize: CGFloat = 24.0
        static let caption2LargeFontSize: CGFloat = 14.0
        static let headlinesLargeFontSize: CGFloat = 16.0
        static let timelineDateLargeFontSize: CGFloat = 12.0
    }
    
    private class func fontDescriptorForTextStyle(style: String) -> UIFontDescriptor {
        if style == CVFontTextStyleRésuméHolderName {
            let headlineFontDescriptor = UIFontDescriptor(name: "Helvetica Neue", size: 0.0)
            return headlineFontDescriptor.fontDescriptorByAddingAttributes([UIFontDescriptorNameAttribute: "Thin"])
        }
        
        let preferredDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(style)
        
        if style == UIFontTextStyleCaption1 ||
            style == CVFontTextStyleCaption2Italic ||
            style == CVFontTextStyleTimelineDate {
            return preferredDescriptor.fontDescriptorWithSymbolicTraits(.TraitItalic)
        }
        
        return preferredDescriptor
    }
    
    private class func largeFontSizeForTextStyle(style: String) -> CGFloat {
        if style == CVFontTextStyleRésuméHolderName {
            return Constants.résuméHolderNameLargeFontSize
        } else if style == UIFontTextStyleCaption2 ||
            style == CVFontTextStyleCaption2Italic {
            return Constants.caption2LargeFontSize
        } else if style == UIFontTextStyleHeadline ||
            style == UIFontTextStyleSubheadline {
            return Constants.headlinesLargeFontSize
        } else if style == CVFontTextStyleTimelineDate {
            return Constants.timelineDateLargeFontSize
        }
        
        return Constants.largeFontSize
    }
    
    private class func fontSizeForTextStyle(style: String) -> CGFloat {
        let contentSizeCategory = UIApplication.sharedApplication().preferredContentSizeCategory
        
        let largeFontSize = largeFontSizeForTextStyle(style)
        
        if contentSizeCategory == UIContentSizeCategoryExtraSmall {
            return largeFontSize - (3 * Constants.ΔFontSize)
        } else if contentSizeCategory == UIContentSizeCategorySmall {
            return largeFontSize - (2 * Constants.ΔFontSize)
        } else if contentSizeCategory == UIContentSizeCategoryMedium {
            return largeFontSize - Constants.ΔFontSize
        } else if contentSizeCategory == UIContentSizeCategoryLarge {
            return largeFontSize
        } else if contentSizeCategory == UIContentSizeCategoryExtraLarge {
            return largeFontSize + Constants.ΔFontSize
        } else if contentSizeCategory == UIContentSizeCategoryExtraExtraLarge {
            return largeFontSize + (2 * Constants.ΔFontSize)
        } else if contentSizeCategory == UIContentSizeCategoryExtraExtraExtraLarge {
            return largeFontSize + (3 * Constants.ΔFontSize)
        }
        
        return 0.0
    }
    
    private class func preferredFontForRésuméHolderName(#fontSize: CGFloat) -> UIFont {
        let thinHeadlineFontDescriptor = fontDescriptorForTextStyle(CVFontTextStyleRésuméHolderName)
        return UIFont(descriptor: thinHeadlineFontDescriptor, size: fontSize)
    }
    
    private class func preferredFontForTextStyle(style: String, fontSize: CGFloat) -> UIFont {
        let descriptor = fontDescriptorForTextStyle(style)
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