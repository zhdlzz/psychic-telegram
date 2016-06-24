//
//  UIButton+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "UIButton+ZhaoChe.h"

@implementation UIButton (ZhaoChe)

- (UIButton *)zc_backgroundColor:(UIColor *)color forState:(UIControlState)state {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:image forState:state];
    return self;
}

+ (UIButton *)zc_ButtonWithTitle:(NSString *)title margin:(CGFloat)margin target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 2 * margin, 40)];
    btn.layer.cornerRadius = 4.;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor zc_BtnDisabledTitleColor] forState:UIControlStateDisabled];
    [btn zc_backgroundColor:[UIColor zc_BtnEnabledBackgroundColor] forState:UIControlStateNormal];
    [btn zc_backgroundColor:[UIColor zc_BtnDisabledBackgroundColor] forState:UIControlStateDisabled];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

@end
