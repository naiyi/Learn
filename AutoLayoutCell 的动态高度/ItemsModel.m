//
//  ItemsModel.m
//  AutoLayoutCell 的动态高度
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ItemsModel.h"

@implementation ItemsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"uid"}];
}
@end
