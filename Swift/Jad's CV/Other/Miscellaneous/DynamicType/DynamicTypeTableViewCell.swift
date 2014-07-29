//
//  DynamicTypeTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol DynamicTypeTableViewCellDelegate {
    func dynamicTableViewCell(cell: DynamicTypeTableViewCell, didChangeOptimalHeight: CGFloat)
}

class DynamicTypeTableViewCell: UITableViewCell {
    
    var delegate: DynamicTypeTableViewCellDelegate?
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangePreferredContentSize:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        self.didChangePreferredContentSize(nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: Override
    
    func reloadDynamicTypeContent() { }
    
    func optimalCellheight() -> CGFloat {
        return 0.0
    }
    
    //MARK: Notification
    
    func didChangePreferredContentSize(notification: NSNotification?) {
        reloadDynamicTypeContent()
        layoutSubviews()
        delegate?.dynamicTableViewCell(self, didChangeOptimalHeight: optimalCellheight())
    }
}
