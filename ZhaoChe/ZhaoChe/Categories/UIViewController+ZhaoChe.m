//
//  UIViewController+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "UIViewController+ZhaoChe.h"
#import <objc/runtime.h>

@implementation UIViewController (ZhaoChe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(zc_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(swizzledMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });

}

- (void)zc_viewWillAppear:(BOOL)animated {
    [self zc_viewWillAppear:animated];
    if (![self isKindOfClass:NSClassFromString(@"UIInputWindowController")] &&
        ![self isKindOfClass:NSClassFromString(@"UINavigationController")] &&
        ![self isKindOfClass:NSClassFromString(@"UICompatibilityInputViewController")] &&
        ![self isKindOfClass:NSClassFromString(@"UIApplicationRotationFollowingControllerNoTouches")] &&
        ![self isKindOfClass:NSClassFromString(@"UIKeyboardCandidateGridCollectionViewController")] &&
        ![self isKindOfClass:NSClassFromString(@"ZCTabBarController")]){
        NSLog(@">>>当前视图控制器:%@", self);
    }
}

@end
