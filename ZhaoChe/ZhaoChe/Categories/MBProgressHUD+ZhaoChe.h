//
//  MBProgressHUD+ZhaoChe.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/28/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

#define DEFAULT_DELAY 1.5 ///< 默认1.5秒后消失

@interface MBProgressHUD (ZhaoChe)

+ (MBProgressHUD *)hudWithMessage:(NSString *)message inView:(UIView *)view;

+ (void)hudWithMessage:(NSString *)message image:(NSString *)imageName inView:(UIView *)view afterDelay:(NSTimeInterval)delay;

@end
