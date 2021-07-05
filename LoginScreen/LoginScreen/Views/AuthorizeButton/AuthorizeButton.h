//
//  AutorizeButton.h
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 03.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonStateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorizeButton : UIButton <ButtonStateProtocol>

- (instancetype)initWithColor: (UIColor *)color;

@end

NS_ASSUME_NONNULL_END
