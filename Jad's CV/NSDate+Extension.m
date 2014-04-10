//
//  NSDate+Extension.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString *)stringFromFormatter:(void(^)(NSDateFormatter *formatter))formatterBlock
{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    
    if (formatterBlock) {
        formatterBlock(formatter);
    }
    
    return [formatter stringFromDate:self];
}

@end
