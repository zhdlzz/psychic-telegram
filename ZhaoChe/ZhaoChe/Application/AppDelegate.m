//
//  AppDelegate.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Life Cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = loginNav;
    [self.window makeKeyAndVisible];
    
    // 全局设置导航栏样式
    [self setupNaviAppearance];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - Private Methods

- (void)setupNaviAppearance {
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName : [UIFont systemFontOfSize:18],
                                                           NSForegroundColorAttributeName : [UIColor zc_NavbarTitleColor]
                                                           }];
    [[UINavigationBar appearance] setBarTintColor:[UIColor zc_NavbarBackgroundColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor zc_NavbarSubtitleColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"导航底边"]];
}

@end
