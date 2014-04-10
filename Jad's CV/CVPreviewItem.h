//
//  CVPreviewItem.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <QuickLook/QuickLook.h>

@interface CVPreviewItem : NSObject <QLPreviewItem>

@property (strong, nonatomic) NSString *documentTitle;
@property (strong, nonatomic) NSURL *localURL;

- (instancetype)initWithTitle:(NSString *)title
                andPreviewURL:(NSURL *)preivewURL;

@end
