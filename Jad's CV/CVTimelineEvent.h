//
//  CVTimelineEvent.h
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

/**
 *  The level of importance of the event.
 */
typedef NS_ENUM(NSInteger, CVTimelineEventImportance) {
    /// Importance not set.
    CVTimelineEventImportanceNone,
    /// Big event, usually start of work somewhere.
    CVTimelineEventImportanceMajor,
    /// Small event, usually end of work somewhere.
    CVTimelineEventImportanceMinor
};

/**
 *  An object representing an event in my work experience.
 */
@interface CVTimelineEvent : CVExtractedObject

@property (nonatomic, strong) UIColor *color;
/// The description of the event.
@property (nonatomic, strong) NSString *eventDescription;
/// The start date of the event.
@property (nonatomic, strong) NSDate *startDate;
/// The end date of the event.
@property (nonatomic, strong) NSDate *endDate;

/// Importance of the event.
@property (nonatomic) CVTimelineEventImportance importance;

/**
 *  Returns an array of CVTimelineEvent from the resource data.
 *
 *  @return An array of CVTimelineEvent populated from the resource data.
 */
+ (NSArray *)timetableEvents;

@end
