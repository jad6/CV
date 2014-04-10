//
//  JOCircleImageView.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "JOCircleImageView.h"

@implementation JOCircleImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self awakeFromNib];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.layer setCornerRadius:self.frame.size.width / 2.0];
    self.layer.masksToBounds = YES;
}

@end
