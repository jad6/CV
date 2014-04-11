//
//  CVTimelineEvent.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVTimelineEvent.h"

@implementation CVTimelineEvent

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.eventDescription = dictionary[@"description"];
        self.thumbnailImage = [UIImage imageNamed:dictionary[@"imageName"]];
        self.importance = [dictionary[@"importance"] integerValue];
        self.date = dictionary[@"date"];
    }
    return self;
}

+ (NSArray *)extraObjectsFromFilePath:(NSString *)filePath
{
    NSArray *events = [super extraObjectsFromFilePath:filePath];
    
    NSSortDescriptor *dateSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    
    return [events sortedArrayUsingDescriptors:@[dateSortDescriptor]];
}

@end
