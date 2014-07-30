//
//  CollectionViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//TODO: Make class Generic once Apple fixes the bug in Beta 4
class CollectionViewController: UICollectionViewController, List {
    //TODO: re-enable that once Swift supports class variables
    //    private class let defaultCellIdentifier = "Cell"
    
    private class func defaultCellIdentifier() -> String {
        return "Cell"
    }
    
    var listData: ListData<Referee> = ListData<Referee>() {
    didSet {
        collectionView.reloadData()
    }
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(layout: UICollectionViewLayout, listData: ListData<Referee>) {
        super.init(collectionViewLayout: layout)
        
        self.listData = listData

        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewController.defaultCellIdentifier())
    }
    
    //MARK: List
    
    func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        // Override me!
    }
    
    func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        // Override me!
    }
    
    func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return CollectionViewController.defaultCellIdentifier()
    }
    
    //MARK: Collection view
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return listData.sections.count
    }
    
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return listData[section].rowObjects.count
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        // Get identifiers from overrriden method.
        let identifier = cellIdentifierForIndexPath(indexPath)
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as UICollectionViewCell
        
        // Get object from overriden method.
        let object = listData[indexPath]
        // Let the subclasses configure the cell.
        listView(collectionView, configureCell: cell, withObject: object, atIndexPath: indexPath)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        // Get object from overriden method.
        let object = listData[indexPath]
        // Call overridable method.
        listView(collectionView, didSelectObject: object, atIndexPath: indexPath)
    }
}
