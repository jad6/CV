//
//  CVExtractedObject.h
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

#import <Foundation/Foundation.h>

/**
 *  Abstract object to help extract data from a resource and convert it 
 *  to objects.
 */
@interface CVExtractedObject : NSObject

/**
 *  Extracts the data from a plist into an array of CVExtractedObjects.
 *  The plist must be formatter with a root object as an Array and 
 *  each element as a Dictionary for this method to be successful.
 *  NOTE: If the method returns nil check the error parameter.
 *
 *  @param filePath The file path of the plist.
 *  @param error    An error is allocated if something went wrong.
 *
 *  @return An array of CVExtractedObjects from the resource data.
 */
+ (NSArray *)extraObjectsFromPropertyListAtFilePath:(NSString *)filePath error:(NSError *__autoreleasing *)error;

/**
 *  Creates an instance from a dictionary.
 *
 *  @param dictionary The dictionary to populate the instance from.
 *
 *  @return A populated CVExtractedObject.
 */
- (instancetype)initFromDictionary:(NSDictionary *)dictionary;

@end
