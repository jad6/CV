//
//  CVExtraCurricularTableViewCell.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVExtraCurricularTableViewCell.h"

@interface CVExtraCurricularTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *activityImageView;
@property (nonatomic, weak) IBOutlet UILabel *organisationLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@end

@implementation CVExtraCurricularTableViewCell

- (void)setActivity:(CVExtraCurricularActivity *)activity
{
    if (self->_activity != activity)
    {
        self->_activity = activity;
        
        self.activityImageView.image = activity.organisationImage;
        self.organisationLabel.text = activity.organisation;
    }
}

@end
