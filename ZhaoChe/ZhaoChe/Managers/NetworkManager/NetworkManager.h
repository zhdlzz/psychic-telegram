//
//  NetworkManager.h
//  ChinaCar
//
//  Created by chetuan003 on 4/5/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kServerResponseSuccess; ///< 成功返回0000
extern NSString * const kServerResponseFailure; ///< 失败返回1111
extern NSString * const kServerRequestFailed; ///< 网络请求失败，请稍后重试。
extern NSString * const kErrorURL; ///< 通信出错时，返回请求的链接
extern NSString * const kBaseURL; ///< 请求链接的前半段
extern NSString * const kBaseURLForImage; ///< 图片相关

@interface NetworkManager : NSObject

+ (NetworkManager *)sharedManager;

//- (NSString *)getFullAPIAddressWithKey:(NSString *)key;

- (NSString *)getFullAPIWithValue:(NSString *)value;
- (NSString *)getFullImageURLWithValue:(NSString *)value;

- (void)requestServerAPI:(NSString *)api
                  params:(NSDictionary *)params
                 showHud:(BOOL)showHud
       completionHandler:(void(^)(id task, id responseObject, NSError *error))completionHandler;

@end
