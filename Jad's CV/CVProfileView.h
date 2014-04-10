//
//  CVProfileView.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CVProfileView;

@protocol CVProfileViewDelegate <NSObject>

- (void)profileViewDidSelectInfoButton:(CVProfileView *)profileView;
- (void)profileViewDidSelectCloseButton:(CVProfileView *)profileView;

@end

@interface CVProfileView : UIView <UILayoutSupport>

@property (nonatomic, weak) id<CVProfileViewDelegate> delegate;

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end
