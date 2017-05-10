//
//  WallpapersModel.m
//  UICollectionView 瀑布流
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "WallpapersModel.h"

@implementation WallpapersModel
+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"uid"}];
}
@end
