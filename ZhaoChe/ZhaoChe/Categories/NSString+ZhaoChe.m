//
//  NSString+ZhaoChe.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "NSString+ZhaoChe.h"

@implementation NSString (ZhaoChe)

- (NSString *)trimWhiteSpace {
    NSMutableString *str = [self mutableCopy];
    CFStringTrimWhitespace((__bridge CFMutableStringRef)str);
    return str;
}

- (BOOL)isValidMobileNum {
    NSString *regex = @"^(13|14|15|17|18)\\d{9}"; // 校验规则：11位数，并以13,14,15,17,18开头
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isEmpty {
    return [[self trimWhiteSpace] isEqualToString:@""];
}

@end
