//
//  ItemModel.m
//  UI1_数据库练习
//
//  Created by zhangxueming on 16/5/24.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ItemModel.h"
#import "UserModel.h"

@implementation ItemModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID"}];
}

- (void)setUser:(UserModel *)user
{
    _user = user;
    _icon = user.icon;
    _login = user.login;
}


@end
