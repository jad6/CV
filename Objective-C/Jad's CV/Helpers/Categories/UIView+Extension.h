//
//  UIView+Extension.h
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

#import <UIKit/UIKit.h>

/**
 *  Returns an array of views which share the widest width O(n).
 *  The returned views are returned in the order of which they are given.
 *
 *  @param views Views from which to find the widest ones.
 *
 *  @return The views which share the widest width.
 */
NSArray *widestViews(NSArray *views);
/**
 *  Returns the first widest view from the given array of views O(n).
 *  To return all widest views use the `wisdestViews` function.
 *
 *  @param views Views from which to find the widest.
 *
 *  @return The first widest view.
 */
UIView *widestView(NSArray *views);

/**
 *  Returns an array of views which share the tallest height O(n).
 *  The returned views are returned in the order of which they are given.
 *
 *  @param views Views from which to find the tallest ones.
 *
 *  @return The views which share the tallest height.
 */
NSArray *tallestViews(NSArray *views);
/**
 *  Returns the first tallest view from the given array of views O(n).
 *  To return all tallest views use the `tallestViews` function.
 *
 *  @param views Views from which to find the tallest.
 *
 *  @return The first tallest view.
 */
UIView *tallestView(NSArray *views);

/**
 *  Function to retrieve the total combined width of the given views taking into
 *  account the space separating each view.
 *
 *  @param views           Views which make up the accumulated width.
 *  @param separatorLength The separator length between each views.
 *
 *  @return The combined total width including the separation between views.
 */
CGFloat totalWidthWithSeparatorLength(NSArray *views, CGFloat separatorLength);
/**
 *  Function to retrieve the total combined width of the given views.
 *
 *  @param views Views which make up the accumulated width.
 *
 *  @return The combined total width.
 */
CGFloat totalWidth(NSArray *views);

/**
 *  Function to retrieve the total combined height of the given views taking into
 *  account the space separating each view.
 *
 *  @param views           Views which make up the accumulated height.
 *  @param separatorLength The separator length between each views.
 *
 *  @return The combined total height including the separation between views.
 */
CGFloat totalHeightWithSeparatorLength(NSArray *views, CGFloat separatorLength);
/**
 *  Function to retrieve the total combined height of the given views.
 *
 *  @param views Views which make up the accumulated height.
 *
 *  @return The combined total height.
 */
CGFloat totalHeight(NSArray *views);

@interface UIView (Extension)

#pragma mark - Hiding

/**
 *  Hides or unhides the view with the option the animate the transition.
 *
 *  @param hidden     Wether the view is to be hidden or not.
 *  @param animated   Flag to animate the trasition.
 *  @param duration   The duration of the hiding animation if turned on.
 *  @param completion Call back when the view has been hid or unhid.
 */
- (void)setHidden:(BOOL)hidden
         animated:(BOOL)animated
         duration:(NSTimeInterval)duration
       completion:(void (^)(BOOL finished))completion;

/**
 *  Hides or unhides the view with the option the animate the transition.
 *
 *  For tighter control over the transition use setHidden:animated:duration:completion:
 *
 *  @param hidden   Wether the view is to be hidden or not.
 *  @param animated Flag to animate the trasition.
 */
- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

#pragma mark Positioning

/**
 *  Calculates and returns the value for the X origin of the view which will
 *  center it in relation to the given frame.
 *  The returned X origin is floored.
 *
 *  @param rect The rect which the view will use to center itself.
 *
 *  @return The X origin for the view to take in order to be centered.
 */
- (CGFloat)horizontalCenterWithReferenceRect:(CGRect)rect;
/**
 *  Calculates and returns the value for the Y origin of the view which will
 *  center it in relation to the given frame.
 *  The returned Y origin is floored.
 *
 *  @param rect The rect which the view will use to center itself.
 *
 *  @return The Y origin for the view to take in order to be centered.
 */
- (CGFloat)verticalCenterWithReferenceRect:(CGRect)rect;

/**
 *  This method centers the view to be centered on the X axis with relation
 *  to the passed view.
 *
 *  @param rect The rect which is used as a horizontal centering reference.
 */
- (void)centerHorizontallyWithReferenceRect:(CGRect)rect;
/**
 *  This method centers the view to be centered on the Y axis with relation
 *  to the passed view.
 *
 *  @param rect The rect which is used as a vertical centering reference.
 */
- (void)centerVerticallyWithReferenceRect:(CGRect)rect;

#pragma mark Masking

/**
 *  Method to set a rounded edges mask on the view's layer.
 *
 *  @param radius The radius to use for the rounded edges.
 */
- (void)maskToRadius:(CGFloat)radius;
/**
 *  Masks the view's layer to be in a cirle.
 */
- (void)maskToCircle;

@end