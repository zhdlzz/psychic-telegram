//
//  AppDelegate.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ZCTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Life Cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 测试用
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:IS_USER_LOGGED_IN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:IS_USER_LOGGED_IN]) { // 跳转主界面
        ZCTabBarController *zcTabBar = [[ZCTabBarController alloc] init];
        self.window.rootViewController = zcTabBar;
    } else { // 跳转登录界面
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = loginNav;
    }

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
    
    // 设置导航栏底边颜色
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"导航底边"]];
}

@end
