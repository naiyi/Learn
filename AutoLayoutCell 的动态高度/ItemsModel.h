//
//  ItemsModel.h
//  AutoLayoutCell 的动态高度
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "JSONModel.h"

@interface ItemsModel : JSONModel
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSDictionary *user;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *login;
@end
