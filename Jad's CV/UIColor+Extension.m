//
//  UIColor+Extension.m
//  Jad's CV
//
//  Created by Jad Osseiran on 13/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorFromString:(NSString *)string
{
    NSArray *components = [string componentsSeparatedByString:@","];
    NSUInteger componentsCount = [components count];
    
    if (componentsCount != 4)
    {
        return nil;
    }
    
    CGFloat red = [components[0] floatValue];
    CGFloat green = [components[1] floatValue];
    CGFloat blue = [components[2] floatValue];
    CGFloat alpha = [components[3] floatValue];
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
