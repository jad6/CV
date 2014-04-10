//
//  CVRefereeCollectionViewCell.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVRefereeCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *firstNameLabel, *secondNameLabel;
@property (nonatomic, weak) IBOutlet UITextView *informationTextView;
@property (nonatomic, weak) IBOutlet UIImageView *pictureImageView;

@end
