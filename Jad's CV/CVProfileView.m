//
//  CVProfileView.m
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

#import "CVProfileView.h"

#import "UIView+Snapshot.h"

@interface CVProfileView ()

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageView;

@property (nonatomic) BOOL expanded;

@end

@implementation CVProfileView

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
    
    UIImageView *blurredImageView = [[UIImageView alloc] initWithFrame:self.frame];
    
    [self insertSubview:blurredImageView aboveSubview:self.backgroundImageView];
    self.blurredImageView = blurredImageView;
}

#pragma mark - Layout

- (CGFloat)length
{
    return 108.0f;
}

#pragma mark - Logic

- (void)handleBackgroundImageBlur:(BOOL)animated
{
    UIImageView *blurredImageView = self.blurredImageView;
    if (blurredImageView.image == nil)
    {
        blurredImageView.image = [self.backgroundImageView imageWithBlurRadius:10.0f];
    }

#warning Why is this not blurring at the corrct duration?!
    [blurredImageView setHidden:self.expanded
                       animated:animated
                       duration:6];
}

#pragma mark - Actions

/**
 *  Action triggered when the info button has been touched.
 *
 *  @param sender The info button.
 */
- (IBAction)infoAction:(UIButton *)infoButton
{
    // Save the old value to a scop variable.
    BOOL expanded = self.expanded;
    
    // Update the expand flag.
    self.expanded = !self.expanded;
    
    // Call the appropirate delegate method based on the old value.
    if (expanded)
    {
        if ([self.delegate respondsToSelector:@selector(profileViewDidSelectCloseButton:)])
        {
            [self.delegate profileViewDidSelectCloseButton:self];
        }
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(profileViewDidSelectInfoButton:)])
        {
            [self.delegate profileViewDidSelectInfoButton:self];
        }
    }
}

@end
