//
//  ExperienceObject.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceObject: ExtractedObject {
    
    let startDate: NSDate
    let endDate: NSDate
    let organisationImage: UIImage?
    
    let organisation: String
    let position: String
    let detailedDescription: String
    
    class func sortedExperiences() -> [ExperienceObject]? {
        var error = NSError?()
        var objects = self.extractObjects(&error)
        
        error?.handle()
        if var experiences = objects as? [ExperienceObject] {
            experiences.sort() {
                return ($0.startDate.compare($1.startDate) != .OrderedAscending) &&
                    ($0.endDate.compare($1.endDate) != .OrderedAscending)
            }
            
            return experiences
        } else {
            return nil
        }
    }
    
    init(dictionary: NSDictionary) {
        
        self.startDate = dictionary["startDate"] as NSDate
        self.endDate = dictionary["endDate"] as NSDate
        self.organisation = dictionary["organisation"] as String
        self.position = dictionary["position"] as String
        self.detailedDescription = dictionary["description"] as String
        
        if let imageName = dictionary["imageName"] as? String {
            self.organisationImage = UIImage(named: imageName)
        }
        
        super.init(dictionary: dictionary)
    }
}

class ExtraCurricularObject: ExperienceObject {
    
    class func extraCurricularActivities() -> [ExtraCurricularObject]? {
        return self.sortedExperiences() as [ExtraCurricularObject]?
    }
    
    override class func filePathForResource() -> String {
        return NSBundle.mainBundle().pathForResource("Extra Curricular", ofType: "plist")
    }
    
    init(dictionary: NSDictionary) {
        super.init(dictionary: dictionary)
    }
}

class TimelineEventObject: ExperienceObject {
    
    enum Importance {
        case None, Major, Minor
    }
    
    let color: UIColor
    let importance: Importance
    
    class func timelineEvents() -> [TimelineEventObject]? {
        return self.sortedExperiences() as [TimelineEventObject]?
    }
    
    override class func filePathForResource() -> String {
        return NSBundle.mainBundle().pathForResource("Extra Curricular", ofType: "plist")
    }
    
    init(dictionary: NSDictionary) {
        
        
        super.init(dictionary: dictionary)
    }
}