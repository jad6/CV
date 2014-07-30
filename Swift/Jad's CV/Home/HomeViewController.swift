//
//  HomeViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let résuméHolder: RésuméHolder
    
    var sectionsPageViewController: ExperienceNavigationController!
    
    var homeView: HomeView! {
    return view as? HomeView
    }
    
    //MARK: Init
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.sectionsPageViewController = ExperienceNavigationController(rootViewController: ExtraCurricularTableViewController())
        self.résuméHolder = RésuméHolder.résuméHolder()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.addChildViewController(self.sectionsPageViewController)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    //MARK: View lifecycle
    
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
    
    //MARK: Status bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return homeView.profileView.expanded ? .Default : .LightContent
    }
    
    //MARK: Actions
    
    func profileInfoAction(sender: AnyObject) {
        homeView.handleProfileViewFocus()
        
        UIView.animateWithDuration(kProfileViewAnimationDuration) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func emailAction(sender: AnyObject) {
        Contactor.sharedContactor.email(reciepients: [résuméHolder.email], fromController: self)
    }

    func phoneAction(sender: AnyObject) {
        Contactor.call(number: résuméHolder.phoneNumber)
    }
    
    //MARK: Logic
    
    func setupProfileView() {
        let profileView = homeView.profileView
        
        profileView.infoButton.addTarget(self, action: "profileInfoAction:", forControlEvents: .TouchUpInside)

        profileView.nameLabel.text = résuméHolder.fullName
        profileView.descriptionLabel.text = résuméHolder.location
        profileView.profilePictureImageView.image = résuméHolder.picture
        profileView.backgroundImageView.image = résuméHolder.backgroundImage
        profileView.textView.text = résuméHolder.detailDescription
        profileView.emailButton.setTitle(résuméHolder.email, forState: .Normal)
        profileView.phoneButton.setTitle(résuméHolder.phoneNumber, forState: .Normal)
        
        profileView.emailButton.addTarget(self, action: "emailAction:", forControlEvents: .TouchUpInside)
        profileView.phoneButton.addTarget(self, action: "phoneAction:", forControlEvents: .TouchUpInside)
        
        profileView.emailButton.enabled = UIDevice.canEmail()
        profileView.phoneButton.enabled = UIDevice.canCall()
    }
}
