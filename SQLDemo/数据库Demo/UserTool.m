//
//  UserTool.m
//  数据库Demo
//
//  Created by 刘亚飞 on 16/6/10.
//  Copyright © 2016年 刘亚飞. All rights reserved.
//

#import "UserTool.h"
#import "User.h"
#import <sqlite3.h>
@implementation UserTool

static sqlite3 *_db;

+(void)initialize
{
    char *error;
    // 0、创建路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSString *filename = [path stringByAppendingPathComponent:@"mySQL.sqlite"];
    
    // 1、打开数据库
    if (sqlite3_open(filename.UTF8String, &_db) == SQLITE_OK) {
        NSLog(@"打开成功");
    }
    // 2、创建数据库
    NSString *sql = @"create table t_user (id integer primary key autoincrement,name text,age interger,userID interger)";
    if (sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"创建成功");
    }
    

}
+(NSMutableArray *)userWithSql:(NSString *)sql
{
    NSMutableArray *arr = [NSMutableArray array];
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(_db, sql.UTF8String, -1, &stmt, NULL) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            char *name1=(char *)sqlite3_column_text(stmt, 1);
            NSString *name=[[NSString alloc]initWithUTF8String:name1];
            char *age1=(char *)sqlite3_column_text(stmt, 2);
            NSString *age=[[NSString alloc]initWithUTF8String:age1];
            char *ID1=(char *)sqlite3_column_text(stmt, 3);
            NSString *ID=[[NSString alloc]initWithUTF8String:ID1];
            User *user = [User userWithName:name age:age userID:ID];
            [arr addObject:user];
        }
        
    }
    return arr;

}
+(NSArray *)users
{
    
    return [self userWithSql:@"select *from t_user"];
}

@end
