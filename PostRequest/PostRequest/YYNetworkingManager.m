//
//  YYNetworkingManager.m
//  PostRequest
//
//  Created by YY on 2017/3/29.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYNetworkingManager.h"

@interface YYNetworkingManager()<NSURLSessionDelegate>

@end

@implementation YYNetworkingManager



+(void)POST:(NSString *)URL parameters:(id)parameters success:(Success)success failure:(Failure)failure{
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URL]];
    request.HTTPMethod=@"POST";
    NSData *data=[parameters dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody=data;
    NSURLSession *session=[NSURLSession sharedSession];
    
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        success(data);
        failure(error);
    }];
    
    [task resume];
    
    
}


@end
