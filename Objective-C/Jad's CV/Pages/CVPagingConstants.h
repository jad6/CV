//
//  CVPagingConstants.h
//  Jad's CV
//
//  Created by Jad Osseiran on 1/06/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#ifndef Jad_s_CV_CVPagingConstants_h
#define Jad_s_CV_CVPagingConstants_h

typedef NS_ENUM(NSInteger, CVPagingState) {
    CVPagingStateStatic,
    CVPagingStateBeganScroll,
    CVPagingStateFinishedScroll
};

static NSString *const CVPagingNotification = @"CVPagingNotification";
static NSString *const CVPagingStateKey = @"CVPagingStateKey";
static NSString *const CVPagingControllersKey = @"CVPagingControllersKey";

#endif
