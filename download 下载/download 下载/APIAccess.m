//
//  APIAccess.m
//  download 下载
//
//  Created by yosemite on 16/10/8.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "APIAccess.h"
@interface APIAccess ()<NSURLSessionDownloadDelegate>

@end
@implementation APIAccess
//    注册
void inet_user_sign_up(NSData *jsonData, NSString *code, FUNC_CALLBACK_ARG)
{

}
//    登录
void inet_user_sign_in(NSString *arg_name, NSString *arg_pin, NSString *arg_uid, FUNC_CALLBACK_ARG)
{

}
//   获取验证码
void inet_user_authenticode(NSString *arg_number, FUNC_CALLBACK_ARG)
{

}
//    重置密码
void inet_user_reset_pin(NSString *arg_name, NSString *arg_pin, NSString *arg_code, FUNC_CALLBACK_ARG)
{

}
+(void)sessionPOST:(NSString *)url postPram:(id)postPram HTTPHeader:(NSDictionary *)header Success:(postSuccess)responseobjct failer:(postFail)failerror
{
    NSString * postPramstr =[NSString stringWithFormat:@"%@",postPram];
    NSString * URLString = url;
    NSURL * URL = [NSURL URLWithString:URLString];
    
    NSString * postString = postPramstr;
    NSData * postData = [postString dataUsingEncoding:NSUTF8StringEncoding];  //将请求参数字符串转成NSData类型
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"POST"]; //指定请求方式
    [request setURL:URL]; //设置请求的地址
    [request setHTTPBody:postData];  //设置请求的参数
    [request setTimeoutInterval:30];
    [request setCachePolicy:1];
    if (header) {
        for (NSString * key in [header allKeys]) {
            [request setValue:header[key] forHTTPHeaderField:key];
        }
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            
            //            NSLog(@"data:%@",data);
            
            responseobjct(data);
        }
        else
        {
            failerror(error);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    [task resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}









@end
