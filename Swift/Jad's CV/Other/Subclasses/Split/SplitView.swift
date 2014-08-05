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
    
    //MARK:- Properties
    
    var masterViewWidth: CGFloat {
    didSet {
        layoutSubviews()
    }
    }

    let masterView: UIView
    let detailView: UIView
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        self.masterView = UIView()
        self.detailView = UIView()
        self.masterViewWidth = kDefaultMasterWidth

        super.init(coder: aDecoder)
    }
    
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
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        masterView.frame.origin.y = 0.0
        masterView.frame.size.width = masterViewWidth
        masterView.frame.size.height = bounds.size.height
        
        detailView.frame.size.width = bounds.size.width - masterViewWidth
        detailView.frame.size.height = bounds.size.height
        detailView.frame.origin.x = masterView.frame.maxX
    }
    
    //MARK:- Logic
    
    func setMasterWidth(width: CGFloat, animated: Bool) {
        if animated == true {
            UIView.animateWithDuration(Animations.Durations.Short.toRaw()) {
                self.masterViewWidth = width
            }
        } else {
            masterViewWidth = width
        }
    }
}
