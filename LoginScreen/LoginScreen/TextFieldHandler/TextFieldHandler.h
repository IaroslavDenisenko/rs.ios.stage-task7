//
//  UsernameTextFieldDelegate.h
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 03.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITextField.h>
#import "CredentialsInsetTextField.h"

@interface TextFieldHandler: NSObject <UITextFieldDelegate>

- (void)handleAuthenticationFields: (NSArray <CredentialsInsetTextField *> *)fields completion: (void(^)(void))completion;

@end

