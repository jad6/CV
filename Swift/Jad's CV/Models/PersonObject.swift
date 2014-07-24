//
//  PersonObject.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 17/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class PersonObject: ExtractedObject {
    var title: String?
    let firstName: String
    let lastName: String
    let location: String
    let email: String
    let phoneNumber: String
    let picture: UIImage
    
    var fullName: String {
    var name = String()
    if title {
        name = title!
    }
    return name + " " + firstName + " " + lastName
    }
    
    init(dictionary: NSDictionary) {
        self.title = dictionary["title"] as? String
        self.firstName = dictionary["firstName"] as String
        self.lastName = dictionary["lastName"] as String
        self.location = dictionary["location"] as String
        self.phoneNumber = dictionary["phoneNumber"] as String
        self.email = dictionary["email"] as String
        self.picture = UIImage(named: dictionary["imageName"] as String)

        super.init(dictionary: dictionary)
    }
}

class RésuméHolder : PersonObject {
    let detailDescription: String
    let backgroundImage: UIImage
    
    class func résuméHolder() -> RésuméHolder {
        var error = NSError?()
        var holderObjects = self.extractObjects(&error)
        error?.handle()

        assert(holderObjects.count == 1, "There needs to be exactly one (1) résumé holder object")
        
        return holderObjects[0] as RésuméHolder
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("About Me", ofType: "plist")
    }
    
    class func loadBackgroundImage(backgrounfImageInfo: NSDictionary) -> UIImage {
        let backgrounfImageName = backgrounfImageInfo["name"] as String
        let backgrounfImageExtension = backgrounfImageInfo["extension"] as String
        
        let backgroundImagePath = NSBundle.mainBundle().pathForResource(backgrounfImageName, ofType: backgrounfImageExtension)
        return UIImage(contentsOfFile: backgroundImagePath)
    }
    
    init(dictionary: NSDictionary) {
        self.detailDescription = dictionary["description"] as String
        
        let backgrounfImageInfo = dictionary["backgroundImageInfo"] as NSDictionary
        self.backgroundImage = RésuméHolder.loadBackgroundImage(backgrounfImageInfo)
        
        super.init(dictionary: dictionary)
    }
}

class Referee : PersonObject {
    let position: String
    let connection: String
    
    class func refereesListData() -> ListData<Referee> {
        var refereesListData = ListData<Referee>()
        refereesListData.sections += ListSection(rowObjects: Referee.referees(), name: "Referees")
        
        return refereesListData
    }
    
    class func referees() -> [Referee] {
        var error = NSError?()
        var objects = self.extractObjects(&error)
        error?.handle()
        
        return objects as [Referee]
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("Referees", ofType: "plist")
    }
    
    init(dictionary: NSDictionary) {
        self.position = dictionary["position"] as String
        self.connection = dictionary["connection"] as String
        
        super.init(dictionary: dictionary)
    }
}
