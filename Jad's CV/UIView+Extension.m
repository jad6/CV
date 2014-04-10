//
//  UIView+Extension.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    if (animated)
    {
        if (hidden)
        {
            [UIView animateWithDuration:0.3 animations:^{
                self.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [self setHidden:YES];
            }];
        }
        else
        {
            [self setHidden:NO];
            [UIView animateWithDuration:0.3 animations:^{
                self.alpha = 1.0f;
            }];
        }
    }
    else
    {
        [self setHidden:hidden];
    }
}

@end
