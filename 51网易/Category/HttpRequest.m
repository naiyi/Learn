//
//  HttpRequest.m
//  UI2_AFNetWork封装
//
//  Created by zhangxueming on 16/4/7.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"

@interface HttpRequest ()

//@property (nonatomic,copy)responseBlock receiveBlock;

@end


@implementation HttpRequest


//get请求
+ (void)httpGetData:(NSString *)URLString parameters:(id)parameters success:(responseBlock)receiveBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSData class]]) {
            receiveBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@", error.description);
    }];
}

//post请求


@end
