//
//  YYKeyChain.h
//  KeyChain 钥匙串
//
//  Created by yosemite on 16/9/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
//  导入头文件
#import <Security/Security.h>


@interface YYKeyChain : NSObject

+ (void)keyChainSave:(NSString *)service;

+ (NSString *)keyChainLoad;

+ (void)keyChainDelete;

@end
