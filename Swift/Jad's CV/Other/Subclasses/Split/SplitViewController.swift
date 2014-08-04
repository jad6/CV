//
//  SplitViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate {
    func masterViewController(masterViewController: UIViewController, didSelectObject object: Any)
}

class SplitViewController: UIViewController, MasterViewControllerDelegate {

    var splitView: SplitView! {
    return view as? SplitView
    }
    
    //TODO: Generics, force the master view controller to conform to MasterViewControllerDelegate
    var masterViewController: UIViewController!
    var detailViewController: UIViewController!
    
    init(masterViewController: UIViewController, detailViewController: UIViewController) {
        self.masterViewController = masterViewController
        self.detailViewController = detailViewController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = SplitView(masterView: masterViewController.view, detailView: detailViewController.view)
    }
    
    func masterViewController(masterViewController: UIViewController, didSelectObject object: Any) {
        // Override me!
    }
}
