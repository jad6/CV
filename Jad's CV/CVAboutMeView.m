//  CVAboutMeView.m
// 
//  Created by Jad Osseiran on 12/04/2014.
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

#import "CVAboutMeView.h"

#import "CVPersonalInfo.h"

#import "CVContactor.h"

@interface CVAboutMeView ()

@property (nonatomic, weak) IBOutlet UIImageView *featheredImageView;

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation CVAboutMeView

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    
    self.emailButton.enabled = [UIApplication emailAvailable];
    self.phoneButton.enabled = [UIApplication phoneAvailable];
}

#pragma mark - Setters & Getters

- (void)setPersonalInfo:(CVPersonalInfo *)personalInfo
{
    if (self->_personalInfo != personalInfo)
    {
        self->_personalInfo = personalInfo;
        
        [self.emailButton setTitle:personalInfo.email forState:UIControlStateNormal];
        [self.phoneButton setTitle:personalInfo.phoneNumber forState:UIControlStateNormal];
        self.textView.text = personalInfo.detailDescription;
    }
}

#pragma mark - Actions

- (IBAction)callAction:(id)sender
{
    [CVContactor callNumber:self.personalInfo.phoneNumber];
}

- (IBAction)emailAction:(id)sender
{
    if (self.emailPresentController)
    {
        [[CVContactor sharedContactor] emailReciepients:@[self.personalInfo.email] inController:self.emailPresentController];
    }
}

@end
