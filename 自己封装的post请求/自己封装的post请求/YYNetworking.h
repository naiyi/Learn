//
//  YYNetworking.h
//  自己封装的post请求
//
//  Created by YY on 2017/4/25.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^Success)(id responseObject);

typedef void (^Failure)(NSString *error);

@interface YYNetworking : NSObject
    
+(void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(Success)success failure:(Failure)failure;
    
@end
