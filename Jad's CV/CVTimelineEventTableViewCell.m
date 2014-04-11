//
//  CVTimelineEventTableViewCell.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTimelineEventTableViewCell.h"

@interface CVTimelineEventTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *eventImageView;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@end

@implementation CVTimelineEventTableViewCell

- (void)setEvent:(CVTimelineEvent *)event
{
    if (self->_event != event)
    {
        self->_event = event;
        
        self.eventImageView.image = event.thumbnailImage;
        self.descriptionLabel.text = event.eventDescription;
        self.dateLabel.text = [event.date stringFromFormatter:^(NSDateFormatter *formatter) {
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterNoStyle];
        }];
    }
}

@end
