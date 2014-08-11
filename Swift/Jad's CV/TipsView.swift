//
//  TipsView.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 11/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TipsView: UIView {
    
    private enum SwipeDirection {
        case Left, Right
    }
    
    private struct LayoutConstants {
        static let circleViewSize = CGSize(width: 44.0, height: 44.0)
    }
    
    //MARK:- Properties
    
    private let circleView = UIView()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))

    private var endAnimationOnNextLoop = false

    private(set) var animatingSwipe = false
    
    //MARK:- Init
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.blurEffectView)
        
        self.circleView.backgroundColor = UIColor.backgroundGrayColor()
        self.circleView.frame.size = LayoutConstants.circleViewSize
        self.circleView.maskToCircle()
        self.blurEffectView.contentView.addSubview(self.circleView)
    }
    
    convenience override init() {
        self.init(frame: CGRectZero)
    }
    
    //MARK:- Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurEffectView.frame = bounds
    }
    
    //MARK:- Logic
    
    func startAnimating() {
        if animatingSwipe == false {
            animatingSwipe = true
            endAnimationOnNextLoop = false
            
            animateMovementWithDirection(.Right)
        }
    }
    
    func endAnimatingOnNextAnimationLoop() {
        endAnimationOnNextLoop = true
    }
    
    private func animateMovementWithDirection(direction: SwipeDirection) {
        var nextDirection: SwipeDirection
        var toX: CGFloat
        
        if direction == .Left {
            toX = 0.0
            nextDirection = .Right
        } else {
            toX = bounds.size.width - circleView.frame.size.width
            nextDirection = .Left
        }
        
        UIView.animateWithDuration(Animations.Durations.Long.toRaw(), animations: {
            self.circleView.frame.origin.x = toX
            }, completion: { (finished: Bool) in
                
                self.circleView.setHidden(true, animated: true, duration: Animations.Durations.ExtraExtraLong.toRaw()) { [unowned self] (finished: Bool) in
                    
                    self.circleView.setHidden(false, animated: true, duration: Animations.Durations.ExtraExtraLong.toRaw()) { (finished: Bool) in
                        
                        if self.endAnimationOnNextLoop == false {
                            self.animateMovementWithDirection(nextDirection)
                        } else {
                            self.animatingSwipe = false
                        }
                    }
                }
        })
    }
}
