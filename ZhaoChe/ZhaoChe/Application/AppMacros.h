//
//  AppMacros.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#ifndef AppMacros_h
#define AppMacros_h

//=======================================
// General
//=======================================
#define APP_BUNDLE_IDENTIFIER   [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define APP_BUNDLE_NAME         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define APP_VERSION             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define APP_BUILD               [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

#define SCREEN_BOUNDS           [UIScreen mainScreen].bounds
#define SCREEN_WIDTH            SCREEN_BOUNDS.size.width
#define SCREEN_HEIGHT           SCREEN_BOUNDS.size.height
#define STATUSBAR_HEIGHT        [UIApplication sharedApplication].statusBarFrame.size.height
#define NAVIGATIONBAR_WIDTH     self.navigationController.navigationBar.frame.size.width
#define NAVIGATIONBAR_HEIGHT    self.navigationController.navigationBar.frame.size.height
#define TABBAR_HEIGHT           self.tabBarController.tabBar.frame.size.height

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#ifdef DEBUG
#define NSLog(frmt, ...) NSLog((@"<文件:%s 行:%d 方法:%s>\n" frmt "\n"), \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif /* AppMacros_h */
