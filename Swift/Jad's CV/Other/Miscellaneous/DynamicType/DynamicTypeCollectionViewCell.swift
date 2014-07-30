//
//  DynamicTypeCollectionViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class DynamicTypeCollectionViewCell: UICollectionViewCell {
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangePreferredContentSize:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        self.reloadDynamicTypeContent()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: Override
    
    func reloadDynamicTypeContent() { }
    
    func optimalCellSize() -> CGSize {
        return CGSizeZero
    }
    
    //MARK: Notification
    
    func didChangePreferredContentSize(notification: NSNotification) {
        reloadDynamicTypeContent()
    }
}
