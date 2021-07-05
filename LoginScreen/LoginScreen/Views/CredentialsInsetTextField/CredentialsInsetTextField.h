//
//  CredentialsInsetTextField.h
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 02.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FieldState) {
    ready, error, success
};

@interface CredentialsInsetTextField : UITextField

@property (nonatomic, assign, readonly) FieldState validationState;

- (void)toggleValidationStateTo: (FieldState)state;
- (instancetype)initWithText: (NSString *)text
                      insetX: (CGFloat) insetX
                      insetY: (CGFloat) insetY;

@end

NS_ASSUME_NONNULL_END
