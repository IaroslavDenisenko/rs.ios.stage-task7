//
//  AppDelegate.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 02.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    self.window.rootViewController = [LoginController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
