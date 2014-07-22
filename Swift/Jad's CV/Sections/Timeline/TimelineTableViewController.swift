//
//  TimelineTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TimelineTableViewController<DataType>: TableViewController<DataType> {
    
    init() {
        super.init(style: .Plain, data: nil)
    }
}
