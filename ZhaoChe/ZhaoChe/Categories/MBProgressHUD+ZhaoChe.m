//
//  MBProgressHUD+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/28/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "MBProgressHUD+ZhaoChe.h"

@implementation MBProgressHUD (ZhaoChe)

+ (MBProgressHUD *)hudWithMessage:(NSString *)message inView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.labelFont = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = YES;
    return hud;
}

+ (void)hudWithMessage:(NSString *)message image:(NSString *)imageName inView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    NSString *trimmedMessage = [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (!trimmedMessage.length) {
        return;
    }
    
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelText = message;
    hud.detailsLabelFont = [UIFont systemFontOfSize:15];
    
    // 设置图片
    //UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 100)];
    //UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
    //imgView.image = [UIImage imageNamed:imageName];
    //imgView.center = customView.center;
    //[customView addSubview:imgView];
    //hud.customView = customView;
    
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

@end
