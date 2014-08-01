//
//  DynamicTypeCollectionViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class DynamicTypeCollectionViewController: CollectionViewController {
    
    private var cellSizes = [Int: CGSize]()
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(layout: UICollectionViewLayout, listData: ListData<Referee>) {
        super.init(layout: layout, listData: listData)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didChangePreferredContentSize:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: Collection view
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        let size = cellSizes[indexPath.row]
        
        return size ? size! : kRefereeCardBaseSize
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
        
        if let dynamicCell = cell as? DynamicTypeCollectionViewCell {
            dynamicCell.layoutSubviews()
            cellSizes[indexPath.row] = dynamicCell.optimalCellSize()
            collectionViewLayout.invalidateLayout()
        }
        
        return cell
    }
    
    //MARK: Notification
    
    func didChangePreferredContentSize(notification: NSNotification) {
        collectionView.reloadData()
    }
}
