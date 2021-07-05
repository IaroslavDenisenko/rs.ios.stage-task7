//
//  SecureField.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 04.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "SecureField.h"
#import "UIColor+Hex.h"

@interface SecureField ()

@property (assign, nonatomic, readwrite) SecureState secureState;

@end

@implementation SecureField

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.borderWidth = 2.0;
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = UIColor.clearColor.CGColor;
        [self toggleSecureStateTo:defult];
    }
    return self;
}

- (void)toggleSecureStateTo:(SecureState)state {
    self.secureState = state;
    switch (state) {
        case defult:
            self.layer.borderColor = UIColor.clearColor.CGColor;
            break;
            
        case sucess:
            self.layer.borderColor = UIColor.turquoiseGreen.CGColor;
            break;
            
        case eror:
            self.layer.borderColor = UIColor.venetianRed.CGColor;
            break;
    }
}

@end
