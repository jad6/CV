//
//  View.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

func widestView(#views: [UIView]) -> UIView {
    var widestView = UIView(frame: CGRectZero)
    for view in views {
        if widestView.frame.size.width < view.frame.size.width {
            widestView = view
        }
    }
    return widestView
}

func tallestView(#views: [UIView]) -> UIView {
    var tallestView = UIView(frame: CGRectZero)
    for view in views {
        if tallestView.frame.size.height < view.frame.size.height {
            tallestView = view
        }
    }
    return tallestView
}

func totalWidth(#views: [UIView], #separatorLength: CGFloat) -> CGFloat {
    var totalWidth: CGFloat = 0.0
    for view in views {
        totalWidth += view.frame.size.width
    }
    return totalWidth + (CGFloat(views.count - 1) * separatorLength)
}

func totalWidth(#views: [UIView]) -> CGFloat {
    return totalWidth(views: views, separatorLength: 0.0)
}

func totalHeight(#views: [UIView], #separatorLength: CGFloat) -> CGFloat {
    var totalHeight: CGFloat = 0.0
    for view in views {
        totalHeight += view.frame.size.height
    }
    return totalHeight + (CGFloat(views.count - 1) * separatorLength)
}

func totalHeight(#views: [UIView]) -> CGFloat {
    return totalHeight(views: views, separatorLength: 0.0)
}

extension UIView {
    
    //MARK: Hiding
    
    func setHidden(hide: Bool, animated: Bool, duration: Double, completion: ((Bool) -> Void)!) {
        if animated {
            if hide {
                UIView.animateWithDuration(duration, animations: {
                    self.alpha = 0.0
                }, completion: { finished in
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
    
    func setHidden(hide: Bool, animated: Bool) {
        setHidden(hide, animated: animated, duration: Animations.Durations.Short.toRaw(), completion: nil)
    }
    
    //MARK: Positioning
    
    func horizontalCenterWithReferenceFrame(frame: CGRect) -> CGFloat {
        let offset = floor((frame.size.width - self.frame.size.width) / 2.0)
        return frame.origin.x + offset
    }
    
    func verticalCenterWithReferenceFrame(frame: CGRect) -> CGFloat {
        let offset = floor((frame.size.height - self.frame.size.height) / 2.0)
        return frame.origin.y + offset
    }
    
    func centerHorizontallyWithReferenceView(view: UIView) {
        self.frame.origin.x = horizontalCenterWithReferenceFrame(view.bounds)
    }

    func centerVerticallyWithReferenceView(view: UIView) {
        self.frame.origin.y = verticalCenterWithReferenceFrame(view.bounds)
    }
    
    //MARK: Masking
    
    func maskToRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func maskToCircle() {
        maskToRadius(frame.size.width / 2.0)
    }
}
