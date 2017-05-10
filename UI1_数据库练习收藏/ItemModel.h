//
//  ItemModel.h
//  UI1_数据库练习
//
//  Created by zhangxueming on 16/5/24.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class UserModel;

@interface ItemModel : JSONModel

@property (nonatomic,copy)NSString *allow_comment;

@property (nonatomic,copy)NSString *comments_count;
@property (nonatomic,copy)NSString *content;

@property (nonatomic,assign)NSInteger ID;//ID-->id;

@property (nonatomic,retain)UserModel *user;

@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)NSString *login;


@end
