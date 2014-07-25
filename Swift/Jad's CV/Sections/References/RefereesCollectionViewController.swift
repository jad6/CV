//
//  RefereesCollectionViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class RefereesCollectionViewController: CollectionViewController {
    
    //TODO: re-enable that once Swift supports class variables
    //    private class let defaultCellIdentifier = "Cell"
    
    private class func refereeCellIdentifier() -> String {
        return "Referee Cell"
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        super.init(layout: RefereesCollectionViewFlowLayout(), listData: Referee.refereesListData())
        
        self.collectionView.registerClass(RefereeCollectionViewCell.self, forCellWithReuseIdentifier: RefereesCollectionViewController.refereeCellIdentifier())
        self.collectionView.backgroundColor = UIColor.backgroundGrayColor()
    }
    
    //MARK: Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        let collectionCell = cell as RefereeCollectionViewCell
        
        if let referee = object as? Referee {
            
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return RefereesCollectionViewController.refereeCellIdentifier()
    }
}
