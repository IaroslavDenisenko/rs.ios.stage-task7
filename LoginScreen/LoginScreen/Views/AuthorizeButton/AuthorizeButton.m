//
//  AutorizeButton.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 03.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "AuthorizeButton.h"
#import "UIColor+Hex.h"

@interface AuthorizeButton ()

@property (assign, nonatomic, readwrite) ButtonState buttonState;

@end

@implementation AuthorizeButton

- (instancetype)initWithColor: (UIColor *)color
{
    self = [super init];
    if (self) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = 2.0;
        self.layer.cornerRadius = 10.0;
        self.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
        [self setTitleColor:color forState: UIControlStateNormal];
        [self setTitle:@"Authorize" forState: UIControlStateNormal];
        [self setImage: [UIImage imageNamed:@"person"] forState: UIControlStateNormal];
        [self setImage: [UIImage imageNamed:@"person-fill"] forState: UIControlStateHighlighted];
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 10.0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, -20.0, 0, 0);
        [self toggleButtonStateTo:defalt];
    }
    return self;
}

- (void)toggleButtonStateTo: (ButtonState)state {
    self.buttonState = state;
    switch (state) {
        case defalt:
            self.backgroundColor = UIColor.whiteColor;
            self.alpha = 1.0;
            self.titleLabel.alpha = 1.0;
            self.userInteractionEnabled = YES;
            break;
        case highlighted:
            self.backgroundColor = [UIColor.littleBoyBlue colorWithAlphaComponent:0.2];
            self.titleLabel.alpha = 0.4;
            break;
        case disabled:
            self.backgroundColor = UIColor.whiteColor;
            self.alpha = 0.5;
            self.titleLabel.alpha = 1.0;
            self.userInteractionEnabled = NO;
            break;
    }
}

@end
