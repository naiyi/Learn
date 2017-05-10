//
//  YYManager.h
//  CoreData
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface YYManager : NSObject

@property (nonatomic,strong)NSManagedObjectContext *managerContext;

+(instancetype)shareInstance;
/**
 *  @brief 创建实例化模型对象，用于虚拟模型映射
 *
 *  @param modelName 模型名
 *
 *  @return 实例化模型对象
 */
-(NSManagedObject *)creatEntityWithModelName:(NSString *)modelName;

/**
 *  @brief 将创建好的实例化模型保存到上下文
 *
 *  @param model 实例化模型
 */

- (void)saveEntityModel:(NSManagedObject *)model;
/**
 *  @brief 删除存入数据库的一个具体的实例化模型对象
 *
 *  @param model 实例化模型
 */

- (void)removeManagerObject:(NSManagedObject *)model;
/**
 *  @brief 更新数据库某个实例化对象内容
 *
 *  @param model 实例化对象
 */

- (void)updateManagerObject:(NSManagedObject *)model;
/**
 *  @brief 查询数据库内容
 *
 *  @param entifyName 模型名
 *  @param predicate  查询条件
 *
 *  @return 查询结果
 */
- (NSArray *)searchCoreDataWithEntifyName:(NSString *)entifyName predicate:(NSPredicate *)predicate;
@end
