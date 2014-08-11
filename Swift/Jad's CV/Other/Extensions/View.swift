//
//  View.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

/**
 *  Returns an array of views which share the widest width O(n).
 *  The returned views are returned in the order of which they are given.
 *
 *  :param: views Views from which to find the widest ones.
 *
 *  :returns: The views which share the widest width.
 */
func widestViews(#views: [UIView]) -> [UIView] {
    var widestViews = [UIView]()
    
    for view in views {
        if widestViews.count > 0 {
            let widestWidth = widestViews.first!.frame.size.width
            let viewWidth = view.frame.size.width
            
            if widestWidth < viewWidth {
                widestViews.removeAll(keepCapacity: false)
                widestViews += [view]
            } else if widestWidth == viewWidth {
                widestViews += [view]
            }
        } else {
            widestViews += [view]
        }
    }
    
    return widestViews
}

/**
 *  Returns the first widest view from the given array of views O(n).
 *  To return all widest views use the `wisdestViews` function.
 *
 *  :param: views Views from which to find the widest.
 *
 *  :returns: The first widest view.
 */
func widestView(#views: [UIView]) -> UIView! {
    let wideViews = widestViews(views: views)
    return wideViews.first
}

/**
 *  Returns an array of views which share the tallest height O(n).
 *  The returned views are returned in the order of which they are given.
 *
 *  :param: views Views from which to find the tallest ones.
 *
 *  :returns: The views which share the tallest height.
 */
func tallestViews(#views: [UIView]) -> [UIView] {
    var tallestViews = [UIView]()
    
    for view in views {
        if tallestViews.count > 0 {
            let tallestHeight = tallestViews.first!.frame.size.height
            let viewHeight = view.frame.size.height
            
            if tallestHeight < viewHeight {
                tallestViews.removeAll(keepCapacity: false)
                tallestViews += [view]
            } else if tallestHeight == viewHeight {
                tallestViews += [view]
            }
        } else {
            tallestViews += [view]
        }
    }
    
    return tallestViews
}

/**
 *  Returns the first tallest view from the given array of views O(n).
 *  To return all tallest views use the `tallestViews` function.
 *
 *  :param: views Views from which to find the tallest.
 *
 *  :returns: The first tallest view.
 */
func tallestView(#views: [UIView]) -> UIView! {
    let tallViews = tallestViews(views: views)
    return tallViews.first
}

func totalWidth(#views: [UIView], #separatorLength: CGFloat) -> CGFloat {
    var totalWidth: CGFloat = 0.0
    for view in views {
        totalWidth += view.frame.size.width
    }
    return totalWidth + (CGFloat(views.count - 1) * separatorLength)
}

/**
 *  Function to retrieve the total combined width of the given views taking into
 *  account the space separating each view.
 *
 *  :param: views           Views which make up the accumulated width.
 *  :param: separatorLength The separator length between each views.
 *
 *  :returns: The combined total width including the separation between views.
 */
func totalWidth(#views: [UIView]) -> CGFloat {
    return totalWidth(views: views, separatorLength: 0.0)
}

/**
 *  Function to retrieve the total combined width of the given views.
 *
 *  :param: views Views which make up the accumulated width.
 *
 *  :returns: The combined total width.
 */
func totalHeight(#views: [UIView], #separatorLength: CGFloat) -> CGFloat {
    var totalHeight: CGFloat = 0.0
    for view in views {
        totalHeight += view.frame.size.height
    }
    return totalHeight + (CGFloat(views.count - 1) * separatorLength)
}

/**
 *  Function to retrieve the total combined height of the given views taking into
 *  account the space separating each view.
 *
 *  :param: views           Views which make up the accumulated height.
 *  :param: separatorLength The separator length between each views.
 *
 *  :returns: The combined total height including the separation between views.
 */
func totalHeight(#views: [UIView]) -> CGFloat {
    return totalHeight(views: views, separatorLength: 0.0)
}

/**
 *  Function to retrieve the total combined height of the given views.
 *
 *  :param: views Views which make up the accumulated height.
 *
 *  :returns: The combined total height.
 */
extension UIView {
    
    //MARK:- Hiding
    
    /**
     *  Hides or unhides the view with the option the animate the transition.
     *
     *  :param: hidden     Wether the view is to be hidden or not.
     *  :param: animated   Flag to animate the trasition.
     *  :param: duration   The duration of the hiding animation if turned on.
     *  :param: completion Call back when the view has been hid or unhid.
     */
    func setHidden(hide: Bool, animated: Bool, duration: Double, completion: ((Bool) -> Void)!) {
        if animated {
            if hide {
                UIView.animateWithDuration(duration, animations: {
                    self.alpha = 0.0
                }, completion: { (finished: Bool) in
                    if finished {
                        self.hidden = true
                    }
                    
                    if completion {
                        completion(finished)
                    }
                })
            } else {
                alpha = 0.0
                hidden = false
                UIView.animateWithDuration(duration, animations: {
                    self.alpha = 1.0
                }, completion: completion)
            }
        } else {
            alpha = hide ? 0.0 : 1.0
            hidden = hide

            if completion {
                completion(true)
            }
        }
    }
    
    /**
     *  Hides or unhides the view with the option the animate the transition.
     *
     *  For tighter control over the transition use setHidden:animated:duration:completion:
     *
     *  :param: hidden   Wether the view is to be hidden or not.
     *  :param: animated Flag to animate the trasition.
     */
    func setHidden(hide: Bool, animated: Bool) {
        setHidden(hide, animated: animated, duration: Animations.Durations.Short.toRaw(), completion: nil)
    }
    
    //MARK:- Positioning
    
    /**
     *  Calculates and returns the value for the X origin of the view which will
     *  center it in relation to the given frame.
     *  The returned X origin is floored.
     *
     *  :param: frame The frame which the view will use to center itself.
     *
     *  :returns: The X origin for the view to take in order to be centered.
     */
    func horizontalCenterWithReferenceFrame(frame: CGRect) -> CGFloat {
        let offset = floor((frame.size.width - self.frame.size.width) / 2.0)
        return frame.origin.x + offset
    }
    
    /**
     *  Calculates and returns the value for the Y origin of the view which will
     *  center it in relation to the given frame.
     *  The returned Y origin is floored.
     *
     *  :param: frame The frame which the view will use to center itself.
     *
     *  :returns: The Y origin for the view to take in order to be centered.
     */
    func verticalCenterWithReferenceFrame(frame: CGRect) -> CGFloat {
        let offset = floor((frame.size.height - self.frame.size.height) / 2.0)
        return frame.origin.y + offset
    }
    
    /**
     *  This method centers the view to be centered on the X axis with relation
     *  to the passed view.
     *
     *  :param: rect The rect which is used as a horizontal centering reference.
     */
    func centerHorizontallyWithReferenceRect(rect: CGRect) {
        self.frame.origin.x = horizontalCenterWithReferenceFrame(rect)
    }

    /**
     *  This method centers the view to be centered on the Y axis with relation
     *  to the passed view.
     *
     *  :param: rect The rect which is used as a vertical centering reference.
     */
    func centerVerticallyWithReferenceRect(rect: CGRect) {
        self.frame.origin.y = verticalCenterWithReferenceFrame(rect)
    }
    
    //MARK:- Masking
    
    /**
     *  Method to set a rounded edges mask on the view's layer.
     *
     *  :param: radius The radius to use for the rounded edges.
     */
    func maskToRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    /**
     *  Masks the view's layer to be in a cirle.
     */
    func maskToCircle() {
        maskToRadius(frame.size.width / 2.0)
    }
}
