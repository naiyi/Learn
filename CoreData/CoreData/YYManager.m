//
//  YYManager.m
//  CoreData
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "YYManager.h"

@implementation YYManager
+(instancetype)shareInstance
{
    static YYManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[YYManager alloc]init];
        
        //配置基本信息
        [manager openDB];
    });
    return manager;
}
- (void)openDB{
    NSURL *modelUrl=[[NSBundle mainBundle]URLForResource:@"CoreData" withExtension:@"momd"];
    NSManagedObjectModel *model=[[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    NSPersistentStoreCoordinator *store=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    NSURL *sqliteUrl=[NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:@"coreData.sqlite"]];
    NSError *error=nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteUrl options:nil error:nil];
    if (error) {
        NSLog(@"-----------数据库打开失败啦。。。。－－－－－－－－");
    }else{
        NSLog(@"-----打开数据库成功，请继续操作－－－－－");
    }
    _managerContext=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _managerContext.persistentStoreCoordinator=store;
}
- (NSManagedObject *)creatEntityWithModelName:(NSString *)modelName{
    
    
    if ([modelName length]>0) {
        
        NSManagedObject *managerObject = [NSEntityDescription insertNewObjectForEntityForName:modelName inManagedObjectContext:_managerContext];
        return managerObject;
    }else{
        return nil;
    }
}

- (void)saveEntityModel:(NSManagedObject *)model{
    
    [self.managerContext insertObject:model];
    NSError *error = nil;
    [self.managerContext save:&error];
    if (error) {
        NSLog(@"-----------数据保存失败啦:%@。。。。－－－－－－－－",error);
    }else{
        NSLog(@"-----数据保存成功。。。。－－－－－");
    }
}

- (void)removeManagerObject:(NSManagedObject *)model {
    
    if (model == nil) {
        return;
    }
    NSError *error = nil;
    [self.managerContext deleteObject:model];
    [self.managerContext save:&error];
    if (error) {
        NSLog(@"-----------数据保存失败啦:%@。。。。－－－－－－－－",error);
    }else{
        NSLog(@"-----数据保存成功。。。。－－－－－");
    }
}

- (void)updateManagerObject:(NSManagedObject *)model {
    
    if (model == nil) {
        return;
    }
    NSError *error = nil;
    if ([self.managerContext save:&error]) {
        NSLog(@"保存%@成功",model);
    } else {
        NSLog(@"保存%@失败：%@",model,error);
    }
    
}
- (NSArray *)searchCoreDataWithEntifyName:(NSString *)entifyName predicate:(NSPredicate *)predicate{
    
    //1.创建查询请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entifyName];
    //    //2>分页查询 limit： 一页的数量
    //    int page = 1;
    //    [request setFetchLimit:5];
    //    [request setFetchOffset:page*5];
    
    //2.定义查询条件
    request.predicate = predicate;
    
    //3.执行查询操作
    NSArray *array = [self.managerContext executeFetchRequest:request error:nil];
    return array;
}

- (void)removeManagerObjecWithModelName:(NSString *)modelName{
    
    NSArray *responsArray = [self searchCoreDataWithEntifyName:modelName predicate:nil];
    for (NSManagedObject* entifyModel in  responsArray) {
        [self.managerContext deleteObject:entifyModel];
    }
    //所有操作暂时都是再内存里面，如果需要保存到数据库 需要使用save
    NSError *error = nil;
    [self.managerContext save:&error];
}

@end
