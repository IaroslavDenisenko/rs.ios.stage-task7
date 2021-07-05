//
//  NumberButton.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 04.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "CircleButton.h"
#import "UIColor+Hex.h"

@interface CircleButton ()

@property (assign, nonatomic) ButtonState buttonState;

@end

@implementation CircleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.borderWidth = 1.5;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = UIColor.littleBoyBlue.CGColor;
        [self setTitleColor:UIColor.littleBoyBlue forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightSemibold];
        [self toggleButtonStateTo:defalt];
    }
    return self;
}

#pragma mark - Private Methods

// Active clickable area for UIButton with rounded corners

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    CGFloat radius = self.bounds.size.width / 2;
    CGPoint point = CGPointZero;
    UITouch *touch = [touches anyObject];
    
    if (touch) {
        point = [touch locationInView:self.superview];
    }

    CGFloat distance = sqrt(powf((self.center.x - point.x), 2) + powf((self.center.y - point.y), 2));

    if (distance < radius) {
        [super touchesBegan:touches withEvent:event];
    }
}

#pragma mark - Public Methods

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
