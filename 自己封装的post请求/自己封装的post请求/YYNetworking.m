//
//  YYNetworking.m
//  自己封装的post请求
//
//  Created by YY on 2017/4/25.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYNetworking.h"


NSString *const ResponseErrorKey = @"com.alamofire.serialization.response.error.response";
NSInteger const Interval = 5;
@implementation YYNetworking

+(void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(Success)success failure:(Failure)failure{

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    //把字典中的参数进行拼接
    NSString *body = [self dealWithParam:params];
    NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置请求体
    [request setHTTPBody:bodyData];
    //设置本次请求的数据请求格式
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    // 设置本次请求请求体的长度(因为服务器会根据你这个设定的长度去解析你的请求体中的参数内容)
    [request setValue:[NSString stringWithFormat:@"%ld", bodyData.length] forHTTPHeaderField:@"Content-Length"];
    //设置请求最长时间
    request.timeoutInterval = Interval;
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            //利用iOS自带原生JSON解析data数据 保存为Dictionary
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(data);
            
        }else{
            NSHTTPURLResponse *httpResponse = error.userInfo[ResponseErrorKey];
            
            if (httpResponse.statusCode != 0) {
                
                NSString *ResponseStr = [self showErrorInfoWithStatusCode:httpResponse.statusCode];
                failure(ResponseStr);
                
            } else {
                NSString *ErrorCode = [self showErrorInfoWithStatusCode:error.code];
                failure(ErrorCode);
            }
        }
    }];
    [task resume];
}
#pragma mark
+ (NSString *)showErrorInfoWithStatusCode:(NSInteger)statusCode{
    
    NSString *message = nil;
    switch (statusCode) {
        case 401: {
            
        }
        break;
        
        case 500: {
            message = @"服务器异常！";
        }
        break;
        
        case -1001: {
            message = @"网络请求超时，请稍后重试！";
        }
        break;
        
        case -1002: {
            message = @"不支持的URL！";
        }
        break;
        
        case -1003: {
            message = @"未能找到指定的服务器！";
        }
        break;
        
        case -1004: {
            message = @"服务器连接失败！";
        }
        break;
        
        case -1005: {
            message = @"连接丢失，请稍后重试！";
        }
        break;
        
        case -1009: {
            message = @"互联网连接似乎是离线！";
        }
        break;
        
        case -1012: {
            message = @"操作无法完成！";
        }
        break;
        
        default: {
            message = @"网络请求发生未知错误，请稍后再试！";
        }
        break;
    }
    return message;
    
}
#pragma mark -- 拼接参数
+ (NSString *)dealWithParam:(NSDictionary *)param
    {
        NSArray *allkeys = [param allKeys];
        NSMutableString *result = [NSMutableString string];
        
        for (NSString *key in allkeys) {
            NSString *string = [NSString stringWithFormat:@"%@=%@&", key, param[key]];
            [result appendString:string];
        }
        return result;
    }
@end
