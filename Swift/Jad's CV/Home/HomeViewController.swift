//
//  HomeViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var sectionsPageViewController: SectionsPageViewController!
    
    var homeView: HomeView! {
    return view as? HomeView
    }
    
    //-- Init
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.sectionsPageViewController = SectionsPageViewController()

        super.init(nibName: nil, bundle: nil)
        
        self.addChildViewController(self.sectionsPageViewController)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    //-- View lifecycle
    
    override func loadView() {
        view = HomeView(sectionsPageView: sectionsPageViewController.view)
    }
    
    override func viewDidLoad() {
        homeView.profileView.infoButton.addTarget(self, action: "profileInfoAction:", forControlEvents: .TouchUpInside)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(Animations.Durations.Short.toRaw()) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    //-- Status bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    //-- Actions
    
    func profileInfoAction(sender: AnyObject) {
        homeView.handleProfileViewFocus()
    }
}
