//
//  HttpRequest.m
//  UI2_AFNetWork封装
//
//  Created by zhangxueming on 16/4/7.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "BSHttpRequest.h"
#import "AFNetworking.h"

@interface BSHttpRequest ()

@end


@implementation BSHttpRequest

//get请求
//- (AFHTTPRequestOperation *)GET:(NSString *)URLString
//                     parameters:(id)parameters
//                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject isKindOfClass:[NSData class]]) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
}

//post请求
//- (AFHTTPRequestOperation *)POST:(NSString *)URLString
//                      parameters:(id)parameters
//                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError * error))failure
{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject isKindOfClass:[NSData class]]) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
}


@end
