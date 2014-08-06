//
//  CVExtractedObject.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer. Redistributions in binary
//  form must reproduce the above copyright notice, this list of conditions and
//  the following disclaimer in the documentation and/or other materials
//  provided with the distribution. Neither the name of the nor the names of
//  its contributors may be used to endorse or promote products derived from
//  this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

#import "CVExtractedObject.h"

@implementation CVExtractedObject

+ (NSArray *)extraObjects:(NSError *__autoreleasing *)error {
    NSString *filePath = [self filePathForResource];

    NSPropertyListFormat plistFormat = 0;
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id allInfo = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&plistFormat error:error];

    NSMutableArray *objects = nil;

    if ([allInfo isKindOfClass:[NSArray class]]) {
        objects = [[NSMutableArray alloc] initWithCapacity:[allInfo count]];

        // For each of the resource create an new object.
        for (id info in allInfo) {
            if (![info respondsToSelector:@selector(objectForKey:)]) {
                return nil;
            }

            CVExtractedObject *object = [[[self class] alloc] initFromDictionary:info];
            [objects addObject:object];
        }
    } else if ([allInfo isKindOfClass:[NSDictionary class]]) {
        objects = [[NSMutableArray alloc] initWithCapacity:1];
        [objects addObject:[[[self class] alloc] initFromDictionary:allInfo]];
    } else {
        return nil;
    }

    return objects;
}

+ (NSString *)filePathForResource {
    return nil;
}

+ (UIImage *)loadBackgroundImage:(NSDictionary *)backgroundImageInfo {
    NSString *backgroundImageName = backgroundImageInfo[@"name"];
    NSString *backgroundImageExtension = backgroundImageInfo[@"extension"];

    NSString *backgroundImagePath = [[NSBundle mainBundle] pathForResource:backgroundImageName ofType:backgroundImageExtension];

    return [[UIImage alloc] initWithContentsOfFile:backgroundImagePath];
}

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

    }
    return self;
}

@end
