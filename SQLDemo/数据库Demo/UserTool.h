//
//  UserTool.h
//  数据库Demo
//
//  Created by 刘亚飞 on 16/6/10.
//  Copyright © 2016年 刘亚飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserTool : NSObject

// 存
+(NSMutableArray *)userWithSql:(NSString *)sql;

+(NSArray *)users;
@end
