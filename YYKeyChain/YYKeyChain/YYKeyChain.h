//
//  YYKeyChain.h
//  YYKeyChain
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYKeyChain : NSObject
//  @param service： 键值
//  保存键值到钥匙串中
+(void)save_key:(NSString *)service data_values:(id)data;

//  查询钥匙串
+(id)load_key:(NSString *)service;

//  删除钥匙串
+(void)delete_key:(NSString *)service;

@end
