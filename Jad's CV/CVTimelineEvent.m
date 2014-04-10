//
//  CVTimelineEvent.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTimelineEvent.h"

@implementation CVTimelineEvent

- (instancetype)initWithEventInfo:(NSDictionary *)eventInfo
{
    self = [super init];
    if (self)
    {
        self.eventDescription = eventInfo[@"description"];
        self.thumbnailImage = [UIImage imageNamed:eventInfo[@"imageName"]];
        self.importance = [eventInfo[@"importance"] integerValue];
        self.date = eventInfo[@"date"];
    }
    return self;
}

+ (NSArray *)timelineEventsFromFileContents:(NSString *)filePath
{
    NSArray *eventsInfo = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *events = [[NSMutableArray alloc] initWithCapacity:[eventsInfo count]];
    
    for (NSDictionary *eventInfo in eventsInfo)
    {
        CVTimelineEvent *event = [[CVTimelineEvent alloc] initWithEventInfo:eventInfo];
        [events addObject:event];
    }
    
    NSSortDescriptor *dateSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    
    return [events sortedArrayUsingDescriptors:@[dateSortDescriptor]];
}

@end
