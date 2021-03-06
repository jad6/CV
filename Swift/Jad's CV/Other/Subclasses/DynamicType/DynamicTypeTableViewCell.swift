//
//  DynamicTypeTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class DynamicTypeTableViewCell: UITableViewCell {
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangePreferredContentSize:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        self.reloadDynamicTypeContent()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK:- Abstract Method
    
    func reloadDynamicTypeContent() { }
    
    func optimalCellheight() -> CGFloat { return 0.0 }
    
    //MARK:- Notification
    
    func didChangePreferredContentSize(notification: NSNotification?) {
        reloadDynamicTypeContent()
    }
}
