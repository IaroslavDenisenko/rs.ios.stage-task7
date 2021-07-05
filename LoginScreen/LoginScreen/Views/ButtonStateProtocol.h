//
//  ButtonStateProtocol.h
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 04.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ButtonState) {
    highlighted, disabled, defalt
};

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonStateProtocol <NSObject>

@property (assign, nonatomic, readonly) ButtonState buttonState;
- (void)toggleButtonStateTo: (ButtonState)state;

@end

NS_ASSUME_NONNULL_END
