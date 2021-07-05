//
//  NSCharacterSet+LatinSymbols.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 03.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "NSCharacterSet+LatinSymbols.h"

@implementation NSCharacterSet (LatinSymbols)

+ (instancetype)onlyLatinLetters {
    return [NSCharacterSet characterSetWithCharactersInString:
    @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
}

@end
