//
//  CVTimelineEventTableViewCell.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer. Redistributions in binary
//  form must reproduce the above copyright notice, this list of conditions and
//  the following disclaimer in the documentation and/or other materials
//  provided with the distribution. Neither the name of the nor the names of
//  its contributors may be used to endorse or promote products derived from
//  this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

#import "CVTimelineEventTableViewCell.h"

#import "JOCircleView.h"

@interface CVTimelineEventTableViewCell ()

@property (nonatomic, weak) IBOutlet JOCircleView *dotView;
@property (nonatomic, weak) IBOutlet UIView *lineView;

@property (nonatomic, weak) IBOutlet UILabel *positionLabel;
/// The description label for the event.
@property (nonatomic, weak) IBOutlet UILabel *organisationLabel;
/// The date label for the event.
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@end

@implementation CVTimelineEventTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    if (IS_IPHONE) {
        UIImage *chevronImage = [UIImage imageNamed:@"chevron"];
        chevronImage = [chevronImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *chevronImageView = [[UIImageView alloc] initWithImage:chevronImage];
        [chevronImageView sizeToFit];
        self.accessoryView = chevronImageView;
    }

    UIView *backgroundView = [[UIView alloc] initWithFrame:self.frame];
    backgroundView.backgroundColor = [UIColor backgroundGrayColor];
    self.selectedBackgroundView = backgroundView;
}

#pragma mark - Setters & Getters

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.lineView.backgroundColor = [UIColor lightGrayColor];
    self.dotView.backgroundColor = self.event.color;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];

    self.lineView.backgroundColor = [UIColor lightGrayColor];
    self.dotView.backgroundColor = self.event.color;
}

- (void)setEvent:(CVTimelineEvent *)event {
    if (self->_event != event) {
        self->_event = event;

        // Set the UI elements from the event.
        self.organisationLabel.text = event.organisation;
        self.positionLabel.text = event.position;

        self.dateLabel.text = [event.startDate combinedCondensedStringWithEndDate:event.endDate withMidString:@" -\n  "];

        UIColor *tintColor = event.color;
        self.dateLabel.textColor = tintColor;
        self.organisationLabel.textColor = tintColor;
        self.positionLabel.textColor = tintColor;
        self.dotView.backgroundColor = tintColor;
        self.accessoryView.tintColor = tintColor;
    }
}

@end
