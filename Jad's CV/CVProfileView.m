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

static CGFloat CVPhotoScaleFactor = 2.0f;

@interface CVProfileView ()

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *photoWidthLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *photoHeightLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *photoHorizontalLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *photoVerticalLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *nameVerticalLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *nameHorizontalLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *descriptionHorizontalLayoutConstraint;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIButton *infoButton;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak) UIImageView *blurredImageView;

@property (nonatomic, weak) UITextView *textView;

@property (nonatomic) BOOL expanded;

@property (nonatomic) CGFloat initialPhotoHorizontalConstant;
@property (nonatomic) CGFloat initialPhotoVerticalConstant;
@property (nonatomic) CGFloat initialNameVerticalConstant;
@property (nonatomic) CGFloat initialNameHorizontalConstant;
@property (nonatomic) CGFloat initialDescriptionHorizontalConstant;

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
    blurredImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self insertSubview:blurredImageView aboveSubview:self.backgroundImageView];
    
    NSDictionary *bindings = NSDictionaryOfVariableBindings(blurredImageView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[blurredImageView]|" options:0 metrics:nil views:bindings]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[blurredImageView]|" options:0 metrics:nil views:bindings]];
    
    self.blurredImageView = blurredImageView;
}

#pragma mark - Getters & Setters 

- (void)setExpanded:(BOOL)expanded
{
    if (self->_expanded != expanded)
    {
        self->_expanded = expanded;
        
        self.tintColor = (expanded) ? [UIColor blackColor] : [UIColor whiteColor];

        [self layoutMainInformation];
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    
    self.infoButton.tintColor = tintColor;
}

#pragma mark - Layout

- (CGFloat)length
{
    return 108.0f;
}

- (void)layoutMainInformation
{
    CGFloat photoHeightConstant = self.photoHeightLayoutConstraint.constant;
    CGFloat photoWidthConstant = self.photoWidthLayoutConstraint.constant;
    CGFloat photoHorizontalConstant = self.photoHorizontalLayoutConstraint.constant;
    CGFloat photoVerticalConstant = self.photoVerticalLayoutConstraint.constant;
    CGFloat nameVerticalConstant = self.nameVerticalLayoutConstraint.constant;
    CGFloat nameHorizontalConstant = self.nameHorizontalLayoutConstraint.constant;
    CGFloat descriptionHorizontalConstant = self.descriptionHorizontalLayoutConstraint.constant;
    
    CGRect frame = self.frame;
    
    if (self.expanded)
    {
        photoHeightConstant = photoHeightConstant * CVPhotoScaleFactor;
        self.photoHeightLayoutConstraint.constant = photoHeightConstant;
        
        photoWidthConstant = photoWidthConstant * CVPhotoScaleFactor;
        self.photoWidthLayoutConstraint.constant = photoWidthConstant;
        
        self.initialPhotoHorizontalConstant = photoHorizontalConstant;
        photoHorizontalConstant = floorf(frame.size.width / 2.0 - photoWidthConstant / 2.0);
        self.photoHorizontalLayoutConstraint.constant = photoHorizontalConstant;
        
        self.initialPhotoVerticalConstant = photoVerticalConstant;
        photoVerticalConstant = photoVerticalConstant * CVPhotoScaleFactor;
        self.photoVerticalLayoutConstraint.constant = photoVerticalConstant;
        
        self.initialNameVerticalConstant = nameVerticalConstant;
        nameVerticalConstant = photoVerticalConstant + photoWidthConstant + 15.0f;
        self.nameVerticalLayoutConstraint.constant = nameVerticalConstant;
        
        self.initialNameHorizontalConstant = nameHorizontalConstant;
        nameHorizontalConstant = floorf(frame.size.width / 2.0 - self.nameLabel.frame.size.width / 2.0);
        self.nameHorizontalLayoutConstraint.constant = nameHorizontalConstant;
        
        self.initialDescriptionHorizontalConstant = descriptionHorizontalConstant;
        descriptionHorizontalConstant = floorf(frame.size.width / 2.0 - self.descriptionLabel.frame.size.width / 2.0);
        self.descriptionHorizontalLayoutConstraint.constant = descriptionHorizontalConstant;
    }
    else
    {
        photoHeightConstant = photoHeightConstant / CVPhotoScaleFactor;
        self.photoHeightLayoutConstraint.constant = photoHeightConstant;
        
        photoWidthConstant = photoWidthConstant / CVPhotoScaleFactor;
        self.photoWidthLayoutConstraint.constant = photoWidthConstant;
        
        self.photoHorizontalLayoutConstraint.constant = self.initialPhotoHorizontalConstant;
        
        photoVerticalConstant = photoVerticalConstant / CVPhotoScaleFactor;
        self.photoVerticalLayoutConstraint.constant = photoVerticalConstant;
        
        self.nameVerticalLayoutConstraint.constant = self.initialNameVerticalConstant;
        self.nameHorizontalLayoutConstraint.constant = self.initialNameHorizontalConstant;
        self.descriptionHorizontalLayoutConstraint.constant = self.initialDescriptionHorizontalConstant;
    }
}

- (void)layoutTextView
{
    UITextView *textView = nil;
    if (self.expanded)
    {
        textView = [[UITextView alloc] init];
        
    }
    else
    {
        textView = self.textView;
        
        [textView removeFromSuperview];
        textView = nil;
    }
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
