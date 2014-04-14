//
//  CVRefereeCollectionViewCell.m
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

#import "CVRefereeCollectionViewCell.h"

#import "JOCircleImageView.h"

@interface CVRefereeCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *fullNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *positionLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationlabel;
@property (nonatomic, weak) IBOutlet UILabel *connectionLabel;
@property (nonatomic, weak) IBOutlet UIButton *phoneButton;
@property (nonatomic, weak) IBOutlet UIButton *emailButton;
@property (nonatomic, weak) IBOutlet JOCircleImageView *pictureImageView;

@property (nonatomic, weak) IBOutlet UIImageView *cardBackgroundImageView;

@end

@implementation CVRefereeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIImage *cardImage = [UIImage imageNamed:@"conatct-card"];
    UIImage *strechedImage = [cardImage resizableImageWithCapInsets:UIEdgeInsetsMake(3.0f, 4.0f, 6.0f, 4.0f) resizingMode:UIImageResizingModeStretch];
    self.cardBackgroundImageView.image = strechedImage;
    
    self.emailButton.enabled = [UIApplication emailAvailable];
    self.phoneButton.enabled = [UIApplication phoneAvailable];
}

#pragma mark - Setters & Getters

- (void)setReferee:(CVReferee *)referee
{
    if (self->_referee != referee)
    {
        self->_referee = referee;
        
        self.fullNameLabel.text = referee.fullName;
        self.positionLabel.text = referee.position;
        self.locationlabel.text = referee.location;
        self.connectionLabel.text = referee.connection;
        
        [self.phoneButton setTitle:referee.phoneNumber forState:UIControlStateNormal];
        [self.emailButton setTitle:referee.email forState:UIControlStateNormal];
        
        self.pictureImageView.image = referee.picture;
    }
}

#pragma mark - Actions

- (IBAction)phoneAction:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(refereeCell:didSelectToCallReferee:)])
    {
        [self.delegate refereeCell:self didSelectToCallReferee:self.referee];
    }
}

- (IBAction)emailAction:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(refereeCell:didSelectToEmailReferee:)])
    {
        [self.delegate refereeCell:self didSelectToEmailReferee:self.referee];
    }
}

@end
