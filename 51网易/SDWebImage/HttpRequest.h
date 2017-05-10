//
//  HttpRequest.h
//  UI2_AFNetWork封装
//
//  Created by zhangxueming on 16/4/7.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^responseBlock) (NSData *receiceData);

@interface HttpRequest : NSObject

+ (void)httpGetData:(NSString *)URLString parameters:(id)parameters success:(responseBlock)receiveBlock;

@end
