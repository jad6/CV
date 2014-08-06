//
//  ExperienceTableViewCell.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 25/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: DynamicTypeTableViewCell {
    
    //MARK:- Properties
    
    let positionLabel = UILabel()
    let organisationLabel = UILabel()
    let dateLabel = UILabel()
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.positionLabel.numberOfLines = 2
        self.contentView.addSubview(self.positionLabel)
        
        self.organisationLabel.numberOfLines = 2
        self.contentView.addSubview(self.organisationLabel)
        
        self.dateLabel.numberOfLines = 2
        self.contentView.addSubview(self.dateLabel)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.backgroundGrayColor()
        self.selectedBackgroundView = backgroundView
    }
}
