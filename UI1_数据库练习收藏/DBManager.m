//
//  DBManager.m
//  UI1_数据库操作
//
//  Created by zhangxueming on 16/5/23.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "DBManager.h"
#import "FMDB.h"
#import "ItemModel.h"
#import <UIKit/UIKit.h>

static DBManager *manager = nil;

@interface DBManager ()
{
    FMDatabase *_dbbase; //数据库解析器
    NSLock *_lock;   //锁
}
@end

//创建数据库 增 删 改 查
@implementation DBManager

+ (instancetype)sharedManager
{
    @synchronized(self) {
        if (manager==nil) {
            manager = [[self alloc] init];
        }
    }
    return manager;
}

- (instancetype)init
{
    if (self= [super init]) {
        _lock = [[NSLock alloc] init];
        [_lock lock];
        //创建数据库
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/Items.db"];
        _dbbase = [[FMDatabase alloc] initWithPath:path];
        if ([_dbbase open]) {
            //创建数据库
            NSString *sql = @"create table if not exists ItemInfo(ID integer,Login varchar(128),Icon varchar(128),Content varchar(4000));";
            BOOL ret = [_dbbase executeUpdate:sql];
            if (!ret) {
                NSLog(@"%@", _dbbase.lastErrorMessage);
            }
            else
            {
                NSLog(@"数据库创建成功");
            }
        }
        else
        {
            NSLog(@"数据库打开失败");
        }
        [_lock unlock];
    }
    return self;
}

//增加数据

- (BOOL)dbbaseInsertItem:(ItemModel *)item
{
    [_lock lock];
    NSString *sql = @"insert into ItemInfo (ID,Login,Icon,Content) values (?,?,?,?);";
    BOOL ret = [_dbbase executeUpdate:sql,[NSNumber numberWithInteger:item.ID],item.login,item.icon,item.content];
    NSLog(@"====");
    [_lock unlock];
    return ret;
}

//删除
- (BOOL)dbbaseDeleteItem:(ItemModel *)item
{
    [_lock lock];
    NSString *sql = @"delete from ItemInfo where ID=?;";
    BOOL ret = [_dbbase executeUpdate:sql,[NSNumber numberWithInteger:item.ID]];
    [_lock unlock];
    return ret;
}

//修改数据

- (BOOL)dbBaseUpdateItem:(ItemModel *)item
{
    [_lock lock];
    NSString *sql = @"update ItemInfo set Icon=?,Login=?,Content=? where ID=?;";
    BOOL ret = [_dbbase executeUpdate:sql,item.icon,item.login,item.content];
    [_lock unlock];
    return ret;
}

//查询遍历

- (NSArray <ItemModel *>*)fetchAllItems
{
    NSMutableArray *items= [NSMutableArray array];
    
    [_lock lock];
    NSString *sql = @"select * from ItemInfo;";
    FMResultSet *set = [_dbbase executeQuery:sql];
    
    while ([set next]) {
        ItemModel *model = [[ItemModel alloc] init];
        model.icon= [set stringForColumn:@"Icon"];
        model.ID = [set longLongIntForColumn:@"ID"];
        model.login = [set stringForColumn:@"Login"];
        model.content = [set stringForColumn:@"content"];
        [items addObject:model];
    }
    [_lock unlock];
    return items;
}

//遍历表,判断数据是否存在
- (BOOL)isItemExist:(ItemModel *)item
{
    [_lock lock];
    NSString *sql = @"select * from ItemInfo where ID=?";
    FMResultSet *set = [_dbbase executeQuery:sql,[NSNumber numberWithInteger:item.ID]];
    BOOL ret = [set next];
    [_lock unlock];
    return ret;
}


@end
