//
//  HttpRequest.h
//  UI2_AFNetWork封装
//
//  Created by zhangxueming on 16/4/7.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSHttpRequest : NSObject

+ (void)GET:(NSString *)URLString
        parameters:(id)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;

+ (void)POST:(NSString *)URLString
        parameters:(id)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError * error))failure;

@end
