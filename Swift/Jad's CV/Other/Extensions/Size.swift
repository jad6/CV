//
//  Size.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 19/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

func CGSizeFloor(size: CGSize) -> CGSize {
    return CGSizeMake(floor(size.width), floor(size.height))
}

func CGSizeCeil(size: CGSize) -> CGSize {
    return CGSizeMake(ceil(size.width), ceil(size.height))
}