//
//  CVTimelineEvent.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CVTimelineEventImportance) {
    CVTimelineEventImportanceNone,
    CVTimelineEventImportanceMajor,
    CVTimelineEventImportanceMinor
};

@interface CVTimelineEvent : NSObject

@property (nonatomic, strong) UIImage *thumbnailImage;
@property (nonatomic, strong) NSString *eventDescription;
@property (nonatomic, strong) NSDate *date;

@property (nonatomic) CVTimelineEventImportance importance;

+ (NSArray *)timelineEventsFromFileContents:(NSString *)filePath;

@end
