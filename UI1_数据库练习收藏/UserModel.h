//
//  UserModel.h
//  UI1_数据库练习
//
//  Created by zhangxueming on 16/5/24.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserModel : JSONModel

@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)NSString * login;

@property (nonatomic,assign)NSInteger uid;

@end
