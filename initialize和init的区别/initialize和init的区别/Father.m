//
//  Father.m
//  initialize和init的区别
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "Father.h"

@implementation Father
+(void)initialize
{
    NSLog(@"+++Father中的 initialize 方法执行+++");
}

-(Father *)init
{
    NSLog(@"++Father中的 init 方法执行++");
    return [super init];
}
@end
