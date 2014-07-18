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

class ResumeHolder : PersonObject {
    let detailDescription: String
    
    class func resumeHolder() -> ResumeHolder? {
        var error = NSError?()
        var holderObjects = self.extractObjects(&error)
        error?.handle()

        assert(holderObjects && holderObjects!.count == 1, "There needs to be exactly one (1) resume holder object")
        
        return holderObjects![0] as? ResumeHolder
    }
    
    override class func filePathForResource() -> String? {
        return NSBundle.mainBundle().pathForResource("About Me", ofType: "plist")
    }
    
    init(dictionary: NSDictionary) {
        self.detailDescription = dictionary["description"] as String
        
        super.init(dictionary: dictionary)
    }
}

class Referee : PersonObject {
    let position: String
    let connection: String
    
    class func referees() -> [Referee]? {
        var error = NSError?()
        var objects = self.extractObjects(&error)
        error?.handle()
        
        return objects as? [Referee]
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
