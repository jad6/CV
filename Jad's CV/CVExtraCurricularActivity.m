//
//  CVExtraCurricularActivity.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVExtraCurricularActivity.h"

#import "CVMergeSorter.h"

@implementation CVExtraCurricularActivity

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.organisation = dictionary[@"organisation"];
        self.organisationImage = [UIImage imageNamed:dictionary[@"imageName"]];
        self.position = dictionary[@"position"];
        self.startDate = dictionary[@"startDate"];
        self.endDate = dictionary[@"endDate"];
        self.activityDescription = dictionary[@"description"];
    }
    return self;
}

+ (NSArray *)extraCurricularActivitiesFromFileContents:(NSString *)filePath
{
    NSSortDescriptor *dateSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"startDate" ascending:NO];
    
    NSArray *activities = [[super extraObjectsFromFilePath:filePath] sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    
    NSMutableDictionary *sectionedActivities = [[NSMutableDictionary alloc] init];
    for (CVExtraCurricularActivity *activity in activities)
    {
        NSString *organisation = activity.organisation;
        NSMutableArray *section = sectionedActivities[organisation];
        
        if (section == nil)
        {
            section = [[NSMutableArray alloc] init];
            sectionedActivities[organisation] = section;
        }
        
        [section addObject:activity];
    }
    
    return [sectionedActivities allValues];
//    return [CVMergeSorter mergeSortedArray:[sectionedActivities allValues] acsending:YES objectKey:@"organisation"];
}

@end
