//
//  UIApplication+Extension.m
//  Jad's CV
//
//  Created by Jad Osseiran on 13/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

+ (BOOL)emailAvailable
{
    return [MFMailComposeViewController canSendMail];
}

+ (BOOL)phoneAvailable
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

@end
