//
//  ExtractedObject.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExtractedObject {
    
    //TODO: re-enable that once Swift supports class variables
//    class var filePathForResource: String?
    
    class func filePathForResource() -> String? {
        return nil
    }
    
    class func extractObjects(error: NSErrorPointer) -> [ExtractedObject] {
        var plistFormat: NSPropertyListFormat = .XMLFormat_v1_0
        let data = NSData(contentsOfFile: filePathForResource())
        //FIXME: Warning NSPropertyListReadOptions should be the option
        let collection: AnyObject! = NSPropertyListSerialization.propertyListWithData(data, options:0, format: &plistFormat, error: error)
        
        var objects = [ExtractedObject]()
        
        if let array = collection as? NSArray {
            for element in array {
                if let info = element as? NSDictionary {
                    objects.append(self(dictionary: info))
                } else {
                    return [ExtractedObject]()
                }
            }
        } else if let dictionary = collection as? NSDictionary {
            objects.append(self(dictionary: dictionary))
        } else {
            return [ExtractedObject]()
        }
        
        return objects
    }
    
    class func loadBackgroundImage(backgrounfImageInfo: NSDictionary) -> UIImage {
        let backgrounfImageName = backgrounfImageInfo["name"] as String
        let backgrounfImageExtension = backgrounfImageInfo["extension"] as String
        
        let backgroundImagePath = NSBundle.mainBundle().pathForResource(backgrounfImageName, ofType: backgrounfImageExtension)
        return UIImage(contentsOfFile: backgroundImagePath)
    }
    
    required init(dictionary: NSDictionary) {
        
    }
}