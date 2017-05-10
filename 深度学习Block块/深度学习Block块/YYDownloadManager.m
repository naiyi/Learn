//
//  YYDownloadManager.m
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYDownloadManager.h"
@interface YYDownloadManager()
{
//    YYDownloadProgressHandler progress1;
}
@end
@implementation YYDownloadManager

+(void)downloadWithURL:(NSString *)URL parameters:(NSDictionary *)para handler:(YYDownloadHandler)handler progress:(YYDownloadProgressHandler)progress{
    //完整URL
    NSString *urlString = [NSString string];
    if (para) {
        //参数拼接url
        NSString *paramStr = [self dealWithParam:para];
        urlString = [URL stringByAppendingString:paramStr];
    }else{
        urlString = URL;
    }
    //对URL中的中文进行转码
    NSString *pathStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
                NSURLSession *session=[NSURLSession sharedSession];
                NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    if (handler) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            handler(data,error);
                        });
                    }
                }];
    [task resume];
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
