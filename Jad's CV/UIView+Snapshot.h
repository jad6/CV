//
//  UIView+Snapshot.h
//  Squadio
//
//  Created by Nathan Wood on 12/01/2014.
//  Copyright (c) 2014 Appening. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)

- (UIImage *)imageWithLightEffect;
- (UIImage *)imageWithExtraLightEffect;
- (UIImage *)imageWithDarkEffect;

- (UIImage *)imageWithBlurRadius:(CGFloat)blurRadius;
- (UIImage *)imageWithBlurRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor;
- (UIImage *)imageWithBlurRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor afterScreenUpdates:(BOOL)afterUpdates;

@end
