//  CVReferee.m
// 
//  Created by Jad Osseiran on 13/04/2014.
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

#import "CVReferee.h"

@implementation CVReferee

+ (NSArray *)referees
{
    NSError *error = nil;
    NSArray *activities = [super extraObjects:&error];
    if (error != nil)
    {
        [error handle];
        return nil;
    }
    
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"fullName" ascending:YES];
    
    return [activities sortedArrayUsingDescriptors:@[nameDescriptor]];
}

+ (NSString *)filePathForResource
{
    return [[NSBundle mainBundle] pathForResource:@"Referees" ofType:@"plist"];
}

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.fullName = dictionary[@"fullName"];
        self.position = dictionary[@"position"];
        self.location = dictionary[@"location"];
        self.connection = dictionary[@"connection"];
        self.phoneNumber = dictionary[@"phoneNumber"];
        self.email = dictionary[@"email"];
        self.picture = [UIImage imageNamed:dictionary[@"imageName"]];
    }
    return self;
}

@end
