//
//  AppDelegate.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = HomeViewController()
        window.makeKeyAndVisible()
                
        return true
    }
}

