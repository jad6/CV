//
//  CVPreviewItem.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVPreviewItem.h"

@implementation CVPreviewItem

@synthesize previewItemTitle = _previewItemTitle;
@synthesize previewItemURL = _previewItemURL;

- (instancetype)initWithTitle:(NSString *)title
                andPreviewURL:(NSURL *)preivewURL
{
    self = [super init];
    if (self) {
        self.localURL = preivewURL;
        self.documentTitle = title;
    }
    return self;
}

- (NSString *)previewItemTitle
{
    if (self->_previewItemTitle == nil)
    {
        _previewItemTitle = self.documentTitle;
    }
    
    return _previewItemTitle;
}

- (NSURL *)previewItemURL
{
    if (self->_previewItemURL == nil)
    {
        _previewItemURL = self.localURL;
    }
    
    return _previewItemURL;
}

@end
