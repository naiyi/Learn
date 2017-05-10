//
//  ViewController.m
//  SQlite3
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()
{
    sqlite3 *_db;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString *fileName=[path stringByAppendingPathComponent:@"mySql.db"];
    if (sqlite3_open(fileName.UTF8String, &_db)==SQLITE_OK) {
        NSLog(@" 创建/打开数据库");
    }
    sqlite3_stmt *stmt;
   const char *createSql="create table if not exists list1 (id integer primary key autoincrement,name text,age integer,sex integer)";
    if (sqlite3_exec(_db, createSql, NULL, &stmt, NULL)==SQLITE_OK) {
        NSLog(@"建表成功");
    }
    
    char *error;
    const char*insertSql="insert into list1 (name,age,sex) values('lisi','22','man')";
    if (sqlite3_exec(_db, insertSql, NULL, &stmt, &error)==SQLITE_OK) {
        NSLog(@"添加数据成功");
    }
    else
    {
        NSLog(@"+++%s+++",error);
    }
    
    
    const char *changeSQL = "update list1 set age = '33' where name = 'zhangsan'";
    
    int updateResult = sqlite3_prepare_v2(_db, changeSQL, -1, &stmt, nil);
    
    if (updateResult != SQLITE_OK) {
        
        NSLog(@"修改失败,%d",updateResult);
    }
    else{
        NSLog(@"修改成功");
        sqlite3_step(stmt);
    }
    
    
//        sql语句格式: delete from 表名 where 列名 ＝ 参数     注：后面的 列名 ＝ 参数 用于判断删除哪条数据
    const char *deleteSQL = "delete from list1 where name = 'zhangsan'";
    
    int deleteResult = sqlite3_prepare_v2(_db, deleteSQL, -1, &stmt, nil);
    
    if (deleteResult != SQLITE_OK) {
        
        NSLog(@"删除失败,%d",deleteResult);
        
    }
    else{
        NSLog(@"删除成功");
        sqlite3_step(stmt);
    }
    
    const char *selectSql="select * from list1 where name like 'lisi'";
    if (sqlite3_prepare(_db, selectSql, -1, &stmt, NULL)==SQLITE_OK) {
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            NSString *name=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
            NSLog(@"%@",name);
            NSString *age=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
            NSLog(@"%@",age);
            NSString *sex=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
            NSLog(@"%@",sex);
            }
        }else
    {
    
        NSLog(@"---%s---",error);
    }
    
    //        销毁stmt,回收资源
//    sqlite3_finalize(stmt);
//    
//    //    关闭数据库
//    sqlite3_close(_db);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
