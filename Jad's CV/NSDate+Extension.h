//
//  NSDate+Extension.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

- (NSString *)stringFromFormatter:(void(^)(NSDateFormatter *formatter))formatterBlock;

@end
