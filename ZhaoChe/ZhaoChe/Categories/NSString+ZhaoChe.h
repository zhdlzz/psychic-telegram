//
//  NSString+ZhaoChe.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZhaoChe)

/**
 *  删除字符串所有空格
 *
 *  @return 返回过滤空格后的字符串
 */
- (NSString *)trimWhiteSpace;

/**
 *  检查手机号码是否符合规则
 *
 *  @return 符合规则返回0，否则返回1
 */
- (BOOL)isValidMobileNum;


- (BOOL)isEmpty;

@end
