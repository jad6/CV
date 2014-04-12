//
//  CVProfileView.h
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

#import <UIKit/UIKit.h>

@class CVProfileView;

/**
 *  Delegate protocol which may give notice when the info button is pressed.
 */
@protocol CVProfileViewDelegate <NSObject>

@optional
/**
 *  The profile view did select the info button. In this app the profile
 *  view should expand to the full view.
 *
 *  @param profileView The profile view who's button is triggered.
 */
- (void)profileViewDidSelectInfoButton:(CVProfileView *)profileView;
/**
 *  The profile view did select the close button. In this app the profile
 *  view should retract to its initial size.
 *
 *  @param profileView The profile view who's button is triggered.
 */
- (void)profileViewDidSelectCloseButton:(CVProfileView *)profileView;

@end

/**
 *  The profile view which contains the about me section.
 */
@interface CVProfileView : UIView <UILayoutSupport>

/// The delegate property.
@property (nonatomic, weak) id<CVProfileViewDelegate> delegate;
/// The label describing the current views seen by the user.
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end
