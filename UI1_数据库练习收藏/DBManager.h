//
//  DBManager.h
//  UI1_数据库操作
//
//  Created by zhangxueming on 16/5/23.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemModel;

@interface DBManager : NSObject

//返回一个数据库管理对象
+ (instancetype)sharedManager;

- (BOOL)dbbaseInsertItem:(ItemModel *)item;

- (BOOL)dbbaseDeleteItem:(ItemModel *)item;

- (BOOL)isItemExist:(ItemModel *)item;

- (BOOL)dbBaseUpdateItem:(ItemModel *)item;

- (NSArray <ItemModel *>*)fetchAllItems;

@end
