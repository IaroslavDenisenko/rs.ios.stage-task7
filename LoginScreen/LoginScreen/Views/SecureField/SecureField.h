//
//  SecureField.h
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 04.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    defult, eror, sucess
} SecureState;

@interface SecureField : UIView

@property (assign, nonatomic, readonly) SecureState secureState;

- (void)toggleSecureStateTo:(SecureState)state;

@end

NS_ASSUME_NONNULL_END
