//
//  UIView+Extension.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  This method will hide the view and animate the hiding.
 *  However the method will only set the alpha to either 0.0f
 *  or 1.0f so if you used custom alpha beware of this method.
 *
 *  @param hidden   true if the view is to be hidden.
 *  @param animated true if the hiding is to be animated.
 */
- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

@end
