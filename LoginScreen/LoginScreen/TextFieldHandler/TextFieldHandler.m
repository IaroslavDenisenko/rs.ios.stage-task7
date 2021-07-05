//
//  UsernameTextFieldDelegate.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 03.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "TextFieldHandler.h"
#import "NSCharacterSet+LatinSymbols.h"

@implementation TextFieldHandler

static NSString const *username = @"username";
static NSString const *password = @"password";

- (void)handleAuthenticationFields: (NSArray <CredentialsInsetTextField *> *)fields completion: (void(^)(void))completion {
    
    for (CredentialsInsetTextField *field in fields) {
        if ([self validateInputTextInField: field]) {
            [field toggleValidationStateTo: success];
        } else {
            [field toggleValidationStateTo: error];
        }
    }
    
    for (CredentialsInsetTextField *field in fields) {
        if (field.validationState != success) {
            return;
        }
    }
    
    for (CredentialsInsetTextField *field in fields) {
        field.alpha = 0.5;
        field.userInteractionEnabled = NO;
    }

    completion();
}

- (BOOL)validateInputTextInField: (CredentialsInsetTextField *)field {
    if (field.isSecureTextEntry) {
        return [field.text isEqual: password];
    }
    return [field.text isEqual: username];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // Выяснить почему не работает этот вариант
    
//    if ([string rangeOfCharacterFromSet:NSCharacterSet.controlCharacterSet].location != NSNotFound) {
//        return YES;
//    }
//
//    NSString *pat = @"[a-z]";
//    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern: pat options: NSRegularExpressionCaseInsensitive error: nil];
//
//    return [regex matchesInString: string options: 0 range: NSMakeRange(0, string.length)].count != 0;
    
    if (textField.isSecureTextEntry) {
        return YES;
    }
    
    NSCharacterSet *notValidCharacters = [[NSCharacterSet onlyLatinLetters] invertedSet];
    return [string rangeOfCharacterFromSet:notValidCharacters].location == NSNotFound;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [(CredentialsInsetTextField *)textField toggleValidationStateTo: ready];
}



@end
