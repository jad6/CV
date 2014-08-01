//
//  SplitView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

private let kDefaultMasterWidth: CGFloat = 320.0

class SplitView: UIView {
    
    var masterViewWidth: CGFloat {
    didSet {
        layoutSubviews()
    }
    }

    private(set) var masterView: UIView!
    private(set) var detailView: UIView!
    
    init(masterView: UIView, detailView: UIView) {
        self.masterView = masterView
        self.detailView = detailView
        self.masterViewWidth = kDefaultMasterWidth
        
        super.init(frame: CGRectZero)
        
        self.addSubview(self.masterView)
        self.addSubview(self.detailView)
    }
    
    convenience init(masterView: UIView, detailView: UIView, masterViewWidth: CGFloat) {
        self.init(masterView: masterView, detailView: detailView)
        
        self.masterViewWidth = masterViewWidth
    }
    
    //MARK: Master width
    
    func setMasterWidth(width: CGFloat, animated: Bool) {
        if animated {
            UIView.animateWithDuration(Animations.Durations.Short.toRaw()) {
                self.masterViewWidth = width
            }
        } else {
            masterViewWidth = width
        }
    }
}
