//
//  CredentialsInsetTextField.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 02.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "CredentialsInsetTextField.h"
#import "UIColor+Hex.h"

@interface CredentialsInsetTextField ()

@property (nonatomic, assign) CGFloat insetX;
@property (nonatomic, assign) CGFloat insetY;
@property (nonatomic, assign, readwrite) FieldState validationState;

@end

@implementation CredentialsInsetTextField

- (instancetype)initWithText: (NSString *)text
                      insetX: (CGFloat) insetX
                      insetY: (CGFloat) insetY
{
    self = [super init];
    if (self) {
        self.layer.borderWidth = 1.5;
        self.layer.cornerRadius = 5.0;
        self.placeholder = text;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.insetX = insetX;
        self.insetY = insetY;
        [self toggleValidationStateTo:ready];
    }
    return self;
}

// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.insetX, self.insetY);
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
     return CGRectInset(bounds, self.insetX, self.insetY);
}

- (void)toggleValidationStateTo: (FieldState)state {
    self.validationState = state;
    switch (state) {
        case ready:
            self.layer.borderColor = [[UIColor blackCoral] CGColor];
            self.alpha = 1.0;
            self.userInteractionEnabled = YES;
            [self setText:nil];
            break;
        case error:
            self.layer.borderColor = [[UIColor venetianRed] CGColor];
            break;
        case success:
            self.layer.borderColor = [[UIColor turquoiseGreen] CGColor];
            break;
    }
}

@end
