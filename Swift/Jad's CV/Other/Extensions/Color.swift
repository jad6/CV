//
//  Color.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorFromRGBString(string: String) -> UIColor {
        var components = string.componentsSeparatedByString(",")
        
        assert(components.count == 4, "To convert an RGB color string there must be exactly 4 elements")
        
        //TODO: Remove the cast to NSString when Swift Strings catch up.
        let red = CGFloat(NSString(string: components[0]).doubleValue)
        let green = CGFloat(NSString(string: components[1]).doubleValue)
        let blue = CGFloat(NSString(string: components[2]).doubleValue)
        let alpha = CGFloat(NSString(string: components[3]).doubleValue)

        return self(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    class func defaultBlueColor() -> UIColor {
        return self.colorFromRGBString("0,122,255,1")
    }
    
    class func backgroundGrayColor() -> UIColor {
        return self.colorFromRGBString("245,245,245,1")
    }
    
    class func timelineGrayColor() -> UIColor {
        return UIColor.lightGrayColor()
    }
}