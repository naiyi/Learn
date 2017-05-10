//
//  YYT1348647909107.m
//  51网易
//
//  Created by YY on 16/4/25.
//  Copyright © 2016年 YY. All rights reserved.
//


#import "YYT1348647909107.h"

@implementation YYT1348647909107

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"template":@"utemplate"}];
}
@end


@implementation YYads

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end

@implementation YYimgextra

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end