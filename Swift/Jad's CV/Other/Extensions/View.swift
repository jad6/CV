//
//  View.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 16/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

extension UIView {
    
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
            alpha = (hide) ? 0.0 : 1.0
            hidden = hide

            if completion {
                completion(true)
            }
        }
    }
    
    func setHidden(hide: Bool, animated: Bool) {
        setHidden(hide, animated: animated, duration: Animations.Durations.Short.toRaw(), completion: nil)
    }
    
    func maskToCircle() {
        layer.cornerRadius = frame.size.width / 2.0
        layer.masksToBounds = true
    }
}
