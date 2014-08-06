//
//  UIView+Extension.m
//
//  Created by Jad Osseiran on 01/08/2014.
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

#import "UIView+Extension.h"

NSArray *widestViews(NSArray *views) {
    NSMutableArray *widestViews = [[NSMutableArray alloc] init];

    for (UIView *view in views) {
        if (widestViews.count > 0) {
            CGFloat widestWidth = ((UIView *)[widestViews firstObject]).frame.size.width;
            CGFloat viewWidth = view.frame.size.width;

            if (widestWidth < viewWidth) {
                [widestViews removeAllObjects];
                [widestViews addObject:view];
            } else if (widestWidth == viewWidth) {
                [widestViews addObject:view];
            }
        } else {
            [widestViews addObject:view];
        }
    }

    return widestViews;
}

UIView *widestView(NSArray *views) {
    NSArray *wideViews = widestViews(views);

    return (wideViews.count > 0) ? [wideViews firstObject] : nil;
}

NSArray *tallestViews(NSArray *views) {
    NSMutableArray *tallestViews = [[NSMutableArray alloc] init];

    for (UIView *view in views) {
        if (tallestViews.count > 0) {
            CGFloat tallestHeight = ((UIView *)[tallestViews firstObject]).frame.size.height;
            CGFloat viewHeight = view.frame.size.height;

            if (tallestHeight < viewHeight) {
                [tallestViews removeAllObjects];
                [tallestViews addObject:view];
            } else if (tallestHeight == viewHeight) {
                [tallestViews addObject:view];
            }
        } else {
            [tallestViews addObject:view];
        }
    }

    return tallestViews;
}

UIView *tallestView(NSArray *views) {
    NSArray *tallViews = tallestViews(views);

    return (tallViews.count > 0) ? [tallViews firstObject] : nil;
}

CGFloat totalWidthWithSeparatorLength(NSArray *views, CGFloat separatorLength) {
    CGFloat totalWidth = 0.0f;

    for (UIView *view in views) {
        totalWidth += view.frame.size.width;
    }
    return totalWidth + ((views.count - 1) * separatorLength);
}

CGFloat totalWidth(NSArray *views) {
    return totalWidthWithSeparatorLength(views, 0.0f);
}

CGFloat totalHeightWithSeparatorLength(NSArray *views, CGFloat separatorLength) {
    CGFloat totalHeight = 0.0f;

    for (UIView *view in views) {
        totalHeight += view.frame.size.height;
    }
    return totalHeight + ((views.count - 1) * separatorLength);
}

CGFloat totalHeight(NSArray *views) {
    return totalHeightWithSeparatorLength(views, 0.0f);
}

@implementation UIView (Extension)

#pragma mark Hiding

- (void)setHidden:(BOOL)hidden
         animated:(BOOL)animated
         duration:(NSTimeInterval)duration
       completion:(void (^)(BOOL finished))completion {
    if (animated) {
        if (hidden) {
            [UIView animateWithDuration:duration animations:^{
                self.alpha = 0.0f;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self setHidden:YES];
                }

                if (completion) {
                    completion(finished);
                }
            }];
        } else {
            self.alpha = 0.0f;
            [self setHidden:NO];
            [UIView animateWithDuration:duration animations:^{
                self.alpha = 1.0f;
            } completion:completion];
        }
    } else {
        self.alpha = hidden ? 0.0f : 1.0f;
        [self setHidden:hidden];
        if (completion) {
            completion(YES);
        }
    }
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
    [self setHidden:hidden animated:animated duration:0.3 completion:nil];
}

#pragma mark Positioning

- (CGFloat)horizontalCenterWithReferenceRect:(CGRect)rect {
    CGFloat offset = floorf((rect.size.width = self.frame.size.width) / 2.0);

    return rect.origin.x + offset;
}

- (CGFloat)verticalCenterWithReferenceRect:(CGRect)rect {
    CGFloat offset = floorf((rect.size.height = self.frame.size.height) / 2.0);

    return rect.origin.y + offset;
}

- (void)centerHorizontallyWithReferenceRect:(CGRect)rect {
    CGRect frame = self.frame;

    frame.origin.x = [self horizontalCenterWithReferenceRect:rect];
    self.frame = frame;
}

- (void)centerVerticallyWithReferenceRect:(CGRect)rect {
    CGRect frame = self.frame;

    frame.origin.y = [self horizontalCenterWithReferenceRect:rect];
    self.frame = frame;
}

#pragma mark Masking

- (void)maskToRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)maskToCircle {
    [self maskToRadius:(self.frame.size.width / 2.0)];
}

@end