//
//  CVEducationViewController.m
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

#import "CVEducationViewController.h"

@interface CVEducationViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UILabel *establishmentLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *completionDateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *fadeImageView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewHeightLayoutConstraint;

@end

@implementation CVEducationViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"EducationTitle", nil);
    
    if (IS_IPAD)
    {
        UIImage *ipadFadeImage = [UIImage imageNamed:@"ipad_fade"];
        UIImage *strechedImage = [ipadFadeImage resizableImageWithCapInsets:UIEdgeInsetsMake(80.0f, 80.0f, 80.0f, 80.0f) resizingMode:UIImageResizingModeStretch];
        self.fadeImageView.image = strechedImage;
    }
    
    [self populateSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutTextView];
}

#pragma mark - Layout

- (void)layoutTextView
{
    UITextView *textView = self.textView;
    CGRect idealTextViewFrame = textView.frame;
    CGSize maxSize = CGSizeMake(idealTextViewFrame.size.width, CGFLOAT_MAX);
    idealTextViewFrame.size = [textView sizeThatFits:maxSize];
    
    UIView *fadeSuperview = self.fadeImageView.superview;
    CGFloat maxHeight = ABS(fadeSuperview.frame.size.height - textView.frame.origin.y) - floorf(self.fadeImageView.frame.size.height / 2.0);
    if (idealTextViewFrame.size.height > maxHeight)
    {
        self.textView.scrollEnabled = YES;
        self.textViewHeightLayoutConstraint.constant = maxHeight;
    }
    else
    {
        self.textView.scrollEnabled = NO;
        self.textViewHeightLayoutConstraint.constant = idealTextViewFrame.size.height;
    }
}

#pragma mark - Logic

- (void)populateSubviews
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Education" ofType:@"plist"];
    NSDictionary *educationInfo = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    self.completionDateLabel.text = educationInfo[@"completion"];
    self.establishmentLabel.text = educationInfo[@"establishment"];
    self.statusLabel.text = educationInfo[@"status"];
    self.textView.text = educationInfo[@"description"];
}

@end
