//
//  UIButton+ZhaoChe.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZhaoChe)

- (nullable UIButton *)zc_backgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

+ (nullable UIButton *)zc_ButtonWithTitle:(nullable NSString *)title
                                   margin:(CGFloat)margin
                                   target:(nullable id)target
                                   action:(nullable SEL)action;

@end
