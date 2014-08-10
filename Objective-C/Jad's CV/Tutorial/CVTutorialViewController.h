//
//  CVTutorialViewController.h
//  Jad's CV
//
//  Created by Jad Osseiran on 6/08/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVTutorialViewController : UIViewController

@property (nonatomic, strong) UIImage *backgroundImage;

+ (BOOL)needsToPresentTutorials;

@end
