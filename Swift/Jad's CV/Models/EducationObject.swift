//
//  EducationObject.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationObject: ExtractedObject {
    let completion: String
    let establishment: String
    let status: String
    let detailDescription: String
    let backgroundImage: UIImage
    
    class func education() -> EducationObject {
        var error = NSError?()
        var educationObjects = self.extractObjects(&error)
        error?.handle()
        
        assert(educationObjects.count == 1, "There needs to be exactly one (1) education object")
        
        return educationObjects[0] as EducationObject
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("Education", ofType: "plist")
    }
    
    init(dictionary: NSDictionary) {
        self.detailDescription = dictionary["description"] as String
        self.completion = dictionary["completion"] as String
        self.establishment = dictionary["establishment"] as String
        self.status = dictionary["status"] as String
        
        let backgrounfImageInfo = dictionary["backgroundImageInfo"] as NSDictionary
        self.backgroundImage = ExtractedObject.loadBackgroundImage(backgrounfImageInfo)
        
        super.init(dictionary: dictionary)
    }
}