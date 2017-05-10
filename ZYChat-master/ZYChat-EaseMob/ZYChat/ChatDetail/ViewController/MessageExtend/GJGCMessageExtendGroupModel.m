//
//  GJGCMessageExtendGroupModel.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 15/11/22.
//  Copyright (c) 2015年 ZYProSoft.  QQ群:219357847  All rights reserved.
//

#import "GJGCMessageExtendGroupModel.h"

@implementation GJGCMessageExtendGroupModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      
                                                      kGJGCMessageExtendUserHeadThumb : @"groupHeadThumb",
                                                      
                                                      kGJGCMessageExtendUserNickname : @"groupName",
                                                      
                                                      }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
