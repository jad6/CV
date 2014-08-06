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
    
    class func sortedExperiences() -> [ExperienceObject] {
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
            return [ExperienceObject]()
        }
    }
    
    required init(dictionary: NSDictionary) {
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
    
    func timeSpentString(separator: String) -> String {
        return startDate.combinedCondensedStringWithEndDate(endDate, withSeparator: separator)
    }
}

class ExtraCurricularActivity: ExperienceObject {
    
    class func extraCurricularActivitiesListData() -> ListData<ExtraCurricularActivity> {
        var extraCurricularActivitiesListData = ListData<ExtraCurricularActivity>()
        extraCurricularActivitiesListData.sections += [ListSection(rowObjects: ExtraCurricularActivity.extraCurricularActivities(), name: "Extra Curricular")]
        
        return extraCurricularActivitiesListData
    }
    
    class func extraCurricularActivities() -> [ExtraCurricularActivity] {
        return self.sortedExperiences() as [ExtraCurricularActivity]
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("Extra Curricular", ofType: "plist")
    }
    
    required init(dictionary: NSDictionary) {
        super.init(dictionary: dictionary)
    }
}

class TimelineEvent: ExperienceObject {
    
    enum Importance: Int, IntegerLiteralConvertible {
        case None = 0, Major, Minor
        
        static func convertFromIntegerLiteral(value: IntegerLiteralType) -> Importance {
            if value == 1 {
                return .Major
            } else if value == 2 {
                return .Minor
            } else {
                return .None
            }
        }
    }
    
    let color: UIColor
    let importance: Importance
    
    class func timelineEventsListData() -> ListData<TimelineEvent> {
        var timelineEventsListData = ListData<TimelineEvent>()
        timelineEventsListData.sections += [ListSection(rowObjects: TimelineEvent.timelineEvents(), name: "Timeline")]
        
        return timelineEventsListData
    }
    
    class func timelineEvents() -> [TimelineEvent] {
        return self.sortedExperiences() as [TimelineEvent]
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("Experience", ofType: "plist")
    }
    
    required init(dictionary: NSDictionary) {
        self.color = UIColor.colorFromRGBString(dictionary["color"] as String)
        
        let importance = dictionary["importance"] as Int
        self.importance = Importance.convertFromIntegerLiteral(importance)
        
        super.init(dictionary: dictionary)
    }
}