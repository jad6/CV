//
//  CVExtraCurricularActivity.h
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVResourceExtractor.h"

@interface CVExtraCurricularActivity : CVResourceExtractor

@property (nonatomic, strong) NSString *organisation, *position;
@property (nonatomic, strong) NSString *activityDescription;
@property (nonatomic, strong) UIImage *organisationImage;
@property (nonatomic, strong) NSDate *startDate, *endDate;

+ (NSArray *)extraCurricularActivitiesFromFileContents:(NSString *)filePath;

@end
