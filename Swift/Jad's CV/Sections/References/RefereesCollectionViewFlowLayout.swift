//
//  RefereesCollectionViewFlowLayout.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

let kRefereeCardBaseSize = CGSize(width: 310.0, height: 200.0)

class RefereesCollectionViewFlowLayout: UICollectionViewFlowLayout {
 
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        self.setupSpacing()
    }
    
    override init() {
        super.init()
        
        self.setupSpacing()
    }
    
    //MARK:- Layout
    
    override func prepareLayout() {
        super.prepareLayout()
        
        itemSize = kRefereeCardBaseSize
    }
    
    //MARK:- Logic
    
    func setupSpacing() {
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 10.0
        
        if UIDevice.isPad() {
            sectionInset = UIEdgeInsets(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0)
        } else {
            sectionInset = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 15.0, right: 0.0)
        }
    }
}
