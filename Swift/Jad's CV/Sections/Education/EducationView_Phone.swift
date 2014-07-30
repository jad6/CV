//
//  EducationView_Phone.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 28/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class EducationView_Phone: EducationView {
    
    struct LayoutConstants_Phone {
        struct Padding {
            static let betweenTopInfoAndTextView: CGFloat = 10.0
        }

        struct TextView {
            static let backgroundImageViewYOffset: CGFloat = 220.0
            static let backgroundImageViewHeight: CGFloat = 320.0
            
            static var fadeImageViewHeight: CGFloat {
            return backgroundImageViewHeight + backgroundImageViewYOffset
            }
            
            static func bottomInset(#textView: UITextView) -> CGFloat {
                return fadeImageViewHeight - textView.contentSize.height
            }
        }
    }

    private var fadeImageView: UIImageView!
    
    init(frame: CGRect) {
        let fadeImage = UIImage(named: "fade_down").resizableImageWithCapInsets(UIEdgeInsets(top: 0.0, left: 1.0, bottom: 260.0, right: 1.0))
        self.fadeImageView = UIImageView(image: fadeImage)
        
        super.init(frame: frame)

        self.backgroundImageView.contentMode = .ScaleAspectFill
    
        self.textView.showsVerticalScrollIndicator = false
        self.textView.textContainerInset = UIEdgeInsets(top: 0.0, left: 40.0, bottom: 0.0, right: 40.0)
        
        self.textView.addObserver(self, forKeyPath: "contentSize", options: .New, context: nil)
        
        self.textView.addSubview(self.backgroundImageView)
        self.textView.sendSubviewToBack(self.backgroundImageView)
        self.textView.insertSubview(self.fadeImageView, aboveSubview: self.backgroundImageView)
    }
    
    deinit {
        self.textView.removeObserver(self, forKeyPath: "contentSize")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        universityLogoImageView.frame.size = LayoutConstants.imageViewSize
        universityLogoImageView.frame.origin.x = LayoutConstants.Padding.side
        
        let labelXOrigin = universityLogoImageView.frame.maxX + LayoutConstants.Padding.betweenHorizontal
        let boundingLabelWidth = bounds.size.width - labelXOrigin
        let boundingLabelSize = CGSize(width: boundingLabelWidth, height: bounds.size.height)
        
        statusLabel.frame.size = statusLabel.sizeThatFits(boundingLabelSize)
        statusLabel.frame.origin.x = labelXOrigin
        statusLabel.frame.origin.y = LayoutConstants.Padding.top
        
        establishmentLabel.frame.size = establishmentLabel.sizeThatFits(boundingLabelSize)
        establishmentLabel.frame.origin.x = labelXOrigin
        establishmentLabel.frame.origin.y = statusLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
        
        completionDateLabel.frame.size = completionDateLabel.sizeThatFits(boundingLabelSize)
        completionDateLabel.frame.origin.x = labelXOrigin
        completionDateLabel.frame.origin.y = establishmentLabel.frame.maxY + LayoutConstants.Padding.betweenVertical
        
        let totalLabelHeights = totalHeight(views: [statusLabel, establishmentLabel, completionDateLabel], separatorLength: LayoutConstants.Padding.betweenVertical)
        
        universityLogoImageView.frame.origin.y = statusLabel.frame.origin.y + floor((totalLabelHeights - universityLogoImageView.frame.size.height) / 2.0)
        
        textView.frame.size.width = bounds.width
        textView.frame.origin.y = max(universityLogoImageView.frame.maxY, completionDateLabel.frame.maxY) + LayoutConstants_Phone.Padding.betweenTopInfoAndTextView
        textView.frame.size.height = bounds.size.height - textView.frame.origin.y
        
        fadeImageView.frame.size.width = textView.frame.width
        fadeImageView.frame.size.height = LayoutConstants_Phone.TextView.fadeImageViewHeight
        
        backgroundImageView.frame.size.width = textView.frame.width
        backgroundImageView.frame.size.height = LayoutConstants_Phone.TextView.backgroundImageViewHeight
        backgroundImageView.frame.origin.y = LayoutConstants_Phone.TextView.backgroundImageViewYOffset
    }
    
    //MARK: Logic
    
    func recalculateTextViewContentInset() {
        textView.contentInset.bottom = LayoutConstants_Phone.TextView.bottomInset(textView: textView)
    }
    
    //MARK: KVO
    
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafePointer<()>) {
        if keyPath == "contentSize" {
            recalculateTextViewContentInset()
        }
    }
    
    //MARK: Dynamic type
    
    override func reloadDynamicTypeContent() {
        super.reloadDynamicTypeContent()
        
        recalculateTextViewContentInset()
    }
}
