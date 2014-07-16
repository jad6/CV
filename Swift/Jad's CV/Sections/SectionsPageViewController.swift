//
//  SectionsPageViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class SectionsPageViewController: UIPageViewController {
    
    convenience init() {
        self.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    }
}