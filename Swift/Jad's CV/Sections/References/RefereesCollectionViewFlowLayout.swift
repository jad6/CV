//
//  RefereesCollectionViewFlowLayout.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class RefereesCollectionViewFlowLayout: UICollectionViewFlowLayout {
 
    init() {
        super.init()
        
        self.setupSpacing()
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        self.setupSpacing()
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        itemSize = CGSize(width: 310.0, height: 200.0)
    }
    
    //MARK: Logic
    
    func setupSpacing() {
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 10.0
    }
}
