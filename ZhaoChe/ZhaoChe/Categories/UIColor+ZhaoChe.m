//
//  UIColor+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "UIColor+ZhaoChe.h"

#define ColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255. green:(g) / 255. blue:(b) / 255. alpha:(a) / 1.]

@implementation UIColor (ZhaoChe)

+ (UIColor *)zc_NavbarBackgroundColor {
    return ColorWithRGBA(249, 249, 249, 1);
}

+ (UIColor *)zc_NavbarTitleColor {
    return ColorWithRGBA(34, 34, 34, 1);
}

+ (UIColor *)zc_NavbarSubtitleColor {
    return ColorWithRGBA(80, 140, 238, 1);
}

+ (UIColor *)zc_NavbarShadowColor {
    return ColorWithRGBA(206, 206, 206, 1);
}

+ (UIColor *)zc_TabbarBackgroundColor {
    return ColorWithRGBA(255, 255, 255, 1);
}

+ (UIColor *)zc_TabbarTitleColor {
    return ColorWithRGBA(144, 144, 144, 1);
}

+ (UIColor *)zc_TabbarShowdowColor {
    return ColorWithRGBA(211, 211, 211, 1);
}

+ (UIColor *)zc_BackgroundColor {
    return ColorWithRGBA(243, 243, 243, 1);
}

+ (UIColor *)zc_CellSeperatorColor {
    return ColorWithRGBA(227, 227, 227, 1);
}

+ (UIColor *)zc_BlueColor {
    return ColorWithRGBA(80, 140, 238, 1);
}

+ (UIColor *)zc_OrangeColor {
    return ColorWithRGBA(255, 118, 30, 1);
}

+ (UIColor *)zc_GreenColor {
    return ColorWithRGBA(85, 227, 110, 1);
}

+ (UIColor *)zc_YellowColor {
    return ColorWithRGBA(246, 234, 202, 1);
}

+ (UIColor *)zc_PinkBackgroundColor {
    return ColorWithRGBA(255, 246, 244, 1);
}

+ (UIColor *)zc_PinkFontColor {
    return ColorWithRGBA(255, 103, 64, 1);
}

+ (UIColor *)zc_FontColor333 {
    return ColorWithRGBA(51, 51, 51, 1);
}

+ (UIColor *)zc_FontColor666 {
    return ColorWithRGBA(102, 102, 102, 1);
}

+ (UIColor *)zc_FontColor999 {
    return ColorWithRGBA(153, 153, 153, 1);
}

+ (UIColor *)zc_BtnDisabledBackgroundColor {
    return ColorWithRGBA(129, 171, 241, 1);
}

+ (UIColor *)zc_BtnDisabledTitleColor {
    return [UIColor colorWithWhite:1. alpha:0.5];
}

+ (UIColor *)zc_BtnEnabledBackgroundColor {
    return ColorWithRGBA(80, 140, 238, 1);
}

@end
