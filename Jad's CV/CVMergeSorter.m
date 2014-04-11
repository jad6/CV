//
//  CVMergeSorter.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVMergeSorter.h"

@implementation CVMergeSorter

+ (NSArray *)mergeSortedArray:(NSArray *)unsortedArray
                  acsending:(BOOL)ascending
                    objectKey:(NSString *)key
{
    // If the array is of length one then it is by default sorted.
    if ([unsortedArray count] <= 1)
    {
        return unsortedArray;
    }

    NSUInteger arrayCount = [unsortedArray count];
    NSUInteger midPoint = arrayCount / 2;
    NSArray *leftArray = [unsortedArray subarrayWithRange:NSMakeRange(0, midPoint)];
    NSArray *rightArray = [unsortedArray subarrayWithRange:NSMakeRange(midPoint + 1, arrayCount - (midPoint + 1))];
    
    leftArray = [self mergeSortedArray:leftArray acsending:ascending objectKey:key];
    rightArray = [self mergeSortedArray:rightArray acsending:ascending objectKey:key];
    
    return [self mergeLeftArray:[leftArray mutableCopy]
                     rightArray:[rightArray mutableCopy]
                      acsending:ascending
                        objectKey:key];
}

+ (NSArray *)mergeLeftArray:(NSMutableArray *)leftArray
                 rightArray:(NSMutableArray *)rightArray
                  acsending:(BOOL)ascending
                  objectKey:(NSString *)key
{
    NSMutableArray *mergedArray = [[NSMutableArray alloc] init];
    
    while ([leftArray count] > 0 || [rightArray count] > 0)
    {
        NSUInteger leftCount = [leftArray count];
        NSUInteger rightCount = [rightArray count];
        
        id leftObject = [[leftArray firstObject] valueForKey:key];
        id rightObject = [[rightArray firstObject] valueForKey:key];
        
        if (leftCount > 0 && rightCount > 0)
        {
            NSComparisonResult result = [leftObject compare:rightObject];
            if (result == NSOrderedAscending)
            {
                [mergedArray addObject:[leftArray firstObject]];
                [leftArray removeObjectAtIndex:0];
            }
            else
            {
                [mergedArray addObject:[rightObject firstObject]];
                [rightArray removeObjectAtIndex:0];
            }
        }
        else if (leftCount > 0)
        {
            [mergedArray addObject:[leftArray firstObject]];
            [leftArray removeObjectAtIndex:0];
        }
        else if (rightCount > 0)
        {
            [mergedArray addObject:[rightObject firstObject]];
            [rightArray removeObjectAtIndex:0];
        }
    }
    
    return mergedArray;
}

@end
