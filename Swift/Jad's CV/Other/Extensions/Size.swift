//
//  Size.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 19/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

extension CGSize {
    var floorSize: CGSize {
    return CGSize(width: floor(width), height: floor(height))
    }
    
    var ceilSize: CGSize {
    return CGSize(width: ceil(width), height: ceil(height))
    }
}