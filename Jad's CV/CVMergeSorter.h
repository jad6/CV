//
//  CVMergeSorter.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVMergeSorter : NSObject

+ (NSArray *)mergeSortedArray:(NSArray *)unsortedArray
                  acsending:(BOOL)ascending
                  objectKey:(NSString *)key;

@end
