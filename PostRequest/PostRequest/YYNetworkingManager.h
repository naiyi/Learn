//
//  YYNetworkingManager.h
//  PostRequest
//
//  Created by YY on 2017/3/29.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Success)(id responseObject);
typedef void (^Failure)(NSError *error);

@interface YYNetworkingManager : NSObject


//  POST请求
//+ (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void(^)(NSProgress *uploadProgress))progress success:(void(^)(id responseObject))success failure:(void (^)(NSError * error))failure;



+(void)POST:(NSString *)URL parameters:(id)parameters success:(Success)success failure:(Failure)failure;



@end
