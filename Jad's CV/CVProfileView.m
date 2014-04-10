//
//  CVProfileView.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVProfileView.h"

@interface CVProfileView ()

@property (nonatomic, weak) IBOutlet UIButton *infoButton;

@property (nonatomic) BOOL fullScreen;

@end

@implementation CVProfileView

#pragma mark - Layout

- (CGFloat)length
{
    return 108.0f;
}

#pragma mark - Actions

- (IBAction)infoAction:(id)sender
{
    if (self.fullScreen)
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
    
    self.fullScreen = !self.fullScreen;
}

@end
