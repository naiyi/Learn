//
//  YYVideoModel.m
//  51网易
//
//  Created by YY on 16/4/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYVideoModel.h"

@implementation YYVideoModel
+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"udescription"}];
}
@end
