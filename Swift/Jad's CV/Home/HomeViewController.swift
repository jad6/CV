//
//  HomeViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var résuméHolder: RésuméHolder?
    
    var sectionsPageViewController: SectionsPageViewController!
    
    var homeView: HomeView! {
    return view as? HomeView
    }
    
    //-- Init
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.sectionsPageViewController = SectionsPageViewController()
        self.résuméHolder = RésuméHolder.résuméHolder()
        
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
        setupProfileView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(Animations.Durations.Short.toRaw()) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    //-- Status bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return (homeView.profileView.expanded) ? .Default : .LightContent
    }
    
    //-- Actions
    
    func profileInfoAction(sender: AnyObject) {
        homeView.handleProfileViewFocus()
        
        UIView.animateWithDuration(kProfileViewAnimationDuration) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func emailAction(sender: AnyObject) {
        Contactor.sharedContactor.email(reciepients: [résuméHolder!.email], fromController: self)
    }

    func phoneAction(sender: AnyObject) {
        Contactor.call(number: résuméHolder!.phoneNumber)
    }
    
    //-- Logic
    
    func setupProfileView() {
        let profileView = homeView.profileView
        
        profileView.infoButton.addTarget(self, action: "profileInfoAction:", forControlEvents: .TouchUpInside)

        if let holder = résuméHolder {
            profileView.nameLabel.text = holder.fullName
            profileView.descriptionLabel.text = holder.location
            profileView.profilePictureImageView.image = holder.picture
            profileView.backgroundImageView.image = holder.backgroundImage
            profileView.textView.text = holder.detailDescription
            profileView.emailButton.setTitle(holder.email, forState: .Normal)
            profileView.phoneButton.setTitle(holder.phoneNumber, forState: .Normal)
            
            profileView.emailButton.addTarget(self, action: "emailAction:", forControlEvents: .TouchUpInside)
            profileView.phoneButton.addTarget(self, action: "phoneAction:", forControlEvents: .TouchUpInside)
        } else {
            profileView.nameLabel.text = "Invalid Data"
            profileView.descriptionLabel.text = "Check the plist data"
            println("hmm looks like you have a wrong data format for the résumé holder")
        }
    }
}
