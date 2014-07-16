//
//  ProfileView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate {
    func profileViewDidSelectInfoButton(_: ProfileView)
    func profileViewDidSelectCloseButton(_: ProfileView)
}

protocol ProfileViewDataSource {
    func controllerForEmailPresentationInProfileView(_: ProfileView) -> UIViewController
}

class ProfileView: UIView, UILayoutSupport {

    var delegate: ProfileViewDelegate?
    var dataSource: ProfileViewDataSource?
    
    var backgroundImageView: UIImageView!
    var profilePictureImageView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var inforButton: UIButton!
    var emailButton: UIButton!
    var phoneButton: UIButton!
    var textView: UITextView!
    
    var expanded: Bool {
    didSet {
        let color = (expanded) ? UIColor.blackColor() : UIColor.whiteColor()
        
        nameLabel.textColor = color
        descriptionLabel.textColor = color
        tintColor = color
    }
    }
    
    var length: CGFloat {
    return 108
    }
    
    init(frame: CGRect) {
        self.backgroundImageView = UIImageView()
        self.profilePictureImageView = UIImageView()
        self.nameLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.inforButton = UIButton()
        self.emailButton = UIButton()
        self.phoneButton = UIButton()
        self.textView = UITextView()
        
        self.expanded = false
        
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

    //-- Layout
}
