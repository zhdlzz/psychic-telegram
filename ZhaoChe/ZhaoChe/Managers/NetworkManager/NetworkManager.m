//
//  NetworkManager.m
//  ChinaCar
//
//  Created by chetuan003 on 4/5/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
#include <sys/utsname.h>

NSString * const kServerResponseSuccess = @"0000";
NSString * const kServerResponseFailure = @"1111";
NSString * const kServerRequestFailed = @"网络请求失败，请稍后重试。";
NSString * const kErrorURL = @"http://115.159.90.216/err";

// http://115.159.90.216/post.log

@implementation NetworkManager

#pragma mark - Singleton Method

+ (NetworkManager *)sharedManager {
    static NetworkManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

// 不用GCD创建单例
//+ (NetworkManager *)sharedManager {
    //static NetworkManager *sharedManager = nil;
    //@synchronized (self) {
        //if (sharedManager == nil) {
            //sharedManager = [[self alloc] init];
        //}
    //}
    //return sharedManager;
//}

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)dealloc {
    
}

#pragma mark - Request Methods

- (NSString *)getFullAPIAddressWithKey:(NSString *)key {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"SERVER_APIs"] objectForKey:key];
}

- (void)requestServerAPI:(NSString *)api
                  params:(NSDictionary *)params
                 showHud:(BOOL)showHud
       completionHandler:(void (^)(id task, id responseObject, NSError *error))completionHandler {
    
    NSDictionary *encodedParams = nil;
    NSDictionary *requestHeaders = nil;
    
    // 消除api两边的空格
    NSString *trimmedAPI = [api stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    // 判断过滤后的api是否不为nil和不为空字符串
    if (trimmedAPI.length) {
        if (params) {
            NSData *serializedParams = [NSJSONSerialization dataWithJSONObject:params
                                                                       options:0
                                                                         error:nil];
            NSString *encodedString = [serializedParams base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
            encodedParams = [NSDictionary dictionaryWithObjectsAndKeys:encodedString, @"data", nil];
        } else {
            
        }
        requestHeaders = [self getRequestHeaders];
        [self requestServerAPI:api
                 encodedParams:encodedParams
                       headers:requestHeaders
                       showHud:showHud
                       timeout:30
                      filePath:nil
             completionHandler:completionHandler];
    } else {
        NSLog(@">>>检查API是否有效: %@", trimmedAPI);
    }
}

- (void)requestServerAPI:(NSString *)api
           encodedParams:(NSDictionary *)encodedParams
                 headers:(NSDictionary *)headers
                 showHud:(BOOL)showHud
                 timeout:(NSTimeInterval)timeout
                filePath:(NSString *)filePath
       completionHandler:(void(^)(NSURLSessionTask *task, id responseObject, NSError *error))completionHandler {
    //NSLog(@">>>请求的头部信息:%@", headers);
    NSString *fullRequestURL;
    if (encodedParams) {
        NSString *encodedString = [encodedParams objectForKey:@"data"];
        //NSLog(@">>>编码后的请求地址:%@?data=%@",api, encodedString);
        fullRequestURL = [NSString stringWithFormat:@"%@?data=%@", api, encodedString];
    } else {
        //NSLog(@">>>编码后的请求地址:%@", api);
        fullRequestURL = [NSString stringWithFormat:@"%@", api];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:fullRequestURL forKey:@"FULLREQUEST_URL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    MBProgressHUD *hud = nil;
    
    if (showHud) {
        hud = [MBProgressHUD hudWithMessage:@"加载中..." inView:nil];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 直接使用服务器本来返回的数据，不做任何解析
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 解析服务器返回的JSON数据
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 解析服务器返回的XML数据
    //manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    // 设置请求头部信息
    if (headers) {
        [headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    manager.requestSerializer.timeoutInterval = timeout;
    
    [manager POST:api parameters:encodedParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@">>>返回信息:%@", responseObject);
        
        if (showHud) {
            [hud hide:YES];
        }
        // 获取返回的头部信息
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)[task response];
        NSDictionary *responseHeaders = [response allHeaderFields];
        // 保存返回的Token
        NSString *token = [responseHeaders objectForKey:@"X-TOKEN"];
        if (token.length) {
            [[NSUserDefaults standardUserDefaults] setValue:token forKey:@"USER_LOGIN_TOKEN"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        NSString *userstate = [responseObject valueForKey:@"usertate"];
        if ([userstate isEqualToString:@"islogin"]) { // islogin过期
            //[NOTIFICATIONCENTER postNotificationName:NOTIFICATION_USER_LOGIN_TOKEN_EXPIRED object:nil userInfo:responseObject];
        } else {
            completionHandler(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (showHud) {
            [hud hide:YES];
        }
        
        if (error) {
            NSLog(@">>>请求的API地址:%@\n>>>错误信息:%@", api, error);
        }
        completionHandler(task, nil, error);
    }];
}


- (NSDictionary *)getRequestHeaders {
    NSString *channel = @"10001";
    //NSString *token = [USERDEFAULTS valueForKey:USER_LOGIN_TOKEN];
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"USER_LOGIN_TOKEN"];
    //NSString *uid = [USERDEFAULTS valueForKey:USER_LOGIN_UID];
    NSString *uid = [[NSUserDefaults standardUserDefaults] valueForKey:@"USER_LOGIN_UID"];
//#warning Saving of the UUID
    NSString *uuid = @"";
    //NSString *cityID = [USERDEFAULTS objectForKey:CITY_ID];
    NSString *cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"CITY_ID"];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSString *clientType = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ? @"2" : @"1";
    NSString *platform = [self getPlatform];
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    screenSize = CGSizeMake(screenSize.width * [UIScreen mainScreen].scale, screenSize.height * [UIScreen mainScreen].scale);
    
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:
                             channel, @"X-CHANNEL",
                             token ? token : @"", @"X-TOKEN",
                             uid ? uid : @"", @"X-UID",
                             uuid ? uuid : @"", @"X-UUID",
                             cityID ? cityID : @"9", @"X-CITYID",
                             systemVersion, @"X-SYSTEM",
                             clientType, @"X-CLIENT-TYPE",
                             platform ? platform : @"", @"X-UA",
                             APP_BUILD, @"X-VERSION-CODE",
                             APP_VERSION, @"X-VERSION-NAME",
                             [NSString stringWithFormat:@"%.lf*%.lf", screenSize.width, screenSize.height], @"X-RESOLUTION",
                             nil];
    return headers;
}

- (NSString *)getPlatform {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 CDMA";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (Cellular)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (Cellular)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (Cellular)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (Cellular)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (Cellular)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (Cellular)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (Cellular)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (Cellular)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return @"Unknown";
}

@end
