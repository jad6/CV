//
//  CVTutorialSwipeView.m
//  Jad's CV
//
//  Created by Jad Osseiran on 6/08/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTutorialSwipeView.h"

#import "JOCircleView.h"

typedef NS_ENUM (NSInteger, CVTutorialCircleSwipeDirection) {
    CVTutorialCircleSwipeDirectionLeft,
    CVTutorialCircleSwipeDirectionRight
};

@interface CVTutorialSwipeView ()

@property (nonatomic, strong) JOCircleView *circleView;

@property (nonatomic, strong) CAAnimation *currentAnimation;
@property (nonatomic, assign) CVTutorialCircleSwipeDirection lastAnimationDirection;

@end

@implementation CVTutorialSwipeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGSize circleViewSize = CGSizeMake(30.0f, 30.0f);
    
    JOCircleView *circleView = [[JOCircleView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, circleViewSize.width, circleViewSize.height)];
    circleView.backgroundColor = [UIColor backgroundGrayColor];
    [self addSubview:circleView];
    
    self.circleView = circleView;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.circleView centerVerticallyWithReferenceRect:self.bounds];
}

- (void)startAnimating {
    [self animateMovementWithDirection:CVTutorialCircleSwipeDirectionRight];
}

- (void)endAnimating {
    if (self.currentAnimation) {
//        self.currentAnimation
    }
}

- (void)animateMovementWithDirection:(CVTutorialCircleSwipeDirection)direction {
    CGRect bounds = self.bounds;
    JOCircleView *circleView = self.circleView;

    CGFloat fromX = 0.0f;
    CGFloat toX = 0.0f;

    if (direction == CVTutorialCircleSwipeDirectionLeft) {
        fromX = bounds.size.width - circleView.frame.size.width;
        toX = 0.0f;
    } else {
        fromX = 0.0f;
        toX = bounds.size.width - circleView.frame.size.width;
    }
    self.lastAnimationDirection = direction;

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;

    animation.keyPath = @"position.x";
    animation.fromValue = @(fromX);
    animation.toValue = @(toX);
    animation.duration = 0.9f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [circleView.layer addAnimation:animation forKey:@"basic"];
    circleView.layer.position = CGPointMake(toX, circleView.frame.origin.y);
}

- (void)animationDidStart:(CAAnimation *)anim {
    self.currentAnimation = anim;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.currentAnimation = nil;
    
    CVTutorialCircleSwipeDirection nextDirection = (self.lastAnimationDirection == CVTutorialCircleSwipeDirectionLeft) ? CVTutorialCircleSwipeDirectionRight : CVTutorialCircleSwipeDirectionLeft;
    
    JOCircleView *circleView = self.circleView;
    __weak __typeof(circleView) weakCircleView = circleView;
    [circleView setHidden:YES
                 animated:YES
                 duration:0.9f
               completion:^(BOOL finished) {
                   __strong __typeof(weakCircleView) strongCircleView = weakCircleView;
                   
                   if (finished) {
                       [strongCircleView setHidden:NO
                                          animated:YES
                                          duration:0.6f
                                        completion:^(BOOL finished) {
                                            if (finished) {
                                                [self animateMovementWithDirection:nextDirection];
                                            }
                                        }];
                   }
               }];
}

@end
