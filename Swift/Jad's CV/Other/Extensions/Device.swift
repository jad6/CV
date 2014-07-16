//
//  Device.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class func isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
}