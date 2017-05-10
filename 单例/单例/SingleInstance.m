//
//  SingleInstance.m
//  单例
//
//  Created by YY on 2017/3/2.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "SingleInstance.h"


@implementation SingleInstance


+(instancetype)shareInstance{
    static id _singleInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_singleInstance) {
            _singleInstance=[[self alloc]init];
        }
    });
    return _singleInstance;
}


-(NSString *)text{
    return @"asd";
}
@end
