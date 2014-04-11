//
//  CVResourceExtractor.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVResourceExtractor.h"

@implementation CVResourceExtractor

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

+ (NSArray *)extraObjectsFromFilePath:(NSString *)filePath
{
    NSArray *allInfo = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSMutableArray *objects = [[NSMutableArray alloc] initWithCapacity:[allInfo count]];
    
    for (NSDictionary *info in allInfo)
    {
        id object = [[[self class] alloc] initFromDictionary:info];
        [objects addObject:object];
    }
    
    return objects;
}

@end
