//
//  SingleInstance.m
//  const   static  extern 的用法
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "SingleInstance.h"

@implementation SingleInstance
static SingleInstance *_singleInstance=nil;//修饰全局变量  使全局变量的作用域仅限于当前文件内部，即当前文件内部才能访问该全局变量
+(SingleInstance *)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleInstance=[[self alloc]init];
    });
    return _singleInstance;
}
@end
