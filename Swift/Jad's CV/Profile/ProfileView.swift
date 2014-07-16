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
    var infoButton: UIButton!
    var emailButton: UIButton? {
    didSet {

    }
    }
    var phoneButton: UIButton?
    var textView: UITextView?
    
    let optionalViews: [UIView?]
    
    var expanded: Bool {
    didSet {
        let color = (expanded) ? UIColor.blackColor() : UIColor.whiteColor()
        
        nameLabel.textColor = color
        descriptionLabel.textColor = color
        tintColor = color
        
        for optionalView in optionalViews {
            
            if optionalView is UIButton {
                var button = optionalView as UIButton
                button = UIButton()
            }
            if optionalView is UITextView {
                var textView = optionalView as UITextView
                textView = UITextView()
            }
        }
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
        self.infoButton = UIButton.buttonWithType(.InfoLight) as UIButton
        
        self.expanded = false
        
        self.optionalViews = [self.emailButton, self.phoneButton, self.textView]
        
        super.init(frame: frame)
        
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.profilePictureImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.infoButton)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

    //-- Layout
}
