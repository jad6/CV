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
    
    //MARK: Actions
    
    func emailAction(sender: UIButton) {
        Contactor.sharedContactor.email(reciepients: [sender.titleForState(.Normal)], fromController: self)
    }
    
    func phoneAction(sender: UIButton) {
        Contactor.call(number: sender.titleForState(.Normal))
    }
    
    //MARK: Abstract Methods
    
    override func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        let collectionCell = cell as RefereeCollectionViewCell
        
        if let referee = object as? Referee {
            collectionCell.photoImageView.image = referee.picture
            collectionCell.fullNameLabel.text = referee.fullName
            collectionCell.connectionLabel.text = referee.connection
            collectionCell.positionLabel.text = referee.position
            collectionCell.locationlabel.text = referee.location
            collectionCell.phoneButton.setTitle(referee.phoneNumber, forState: .Normal)
            collectionCell.emailButton.setTitle(referee.email, forState: .Normal)
            
            collectionCell.phoneButton.addTarget(self, action: "phoneAction:", forControlEvents: .TouchUpInside)
            collectionCell.emailButton.addTarget(self, action: "emailAction:", forControlEvents: .TouchUpInside)
            
            collectionCell.phoneButton.enabled = UIDevice.canCall()
            collectionCell.emailButton.enabled = UIDevice.canEmail()
            
            collectionCell.layoutSubviews()
        }
    }
    
    override func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return RefereesCollectionViewController.refereeCellIdentifier()
    }
}
