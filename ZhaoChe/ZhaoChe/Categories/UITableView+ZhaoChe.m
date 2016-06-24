//
//  UITableView+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "UITableView+ZhaoChe.h"

@implementation UITableView (ZhaoChe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(willMoveToSuperview:);
        SEL swizzledSelector = @selector(zc_willMoveToSuperView:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)zc_willMoveToSuperView:(UIView *)superView {
    [self zc_willMoveToSuperView:superView];
    // 全局设置TableView背景色和cell分割线颜色
    self.backgroundColor = [UIColor zc_BackgroundColor];
    self.separatorColor = [UIColor zc_CellSeperatorColor];
}

@end
