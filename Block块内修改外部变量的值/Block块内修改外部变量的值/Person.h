//
//  Person.h
//  Block块内修改外部变量的值
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^myBlock)(NSString *ss);
@interface Person : NSObject
@property (nonatomic,copy)myBlock block;
@property (nonatomic,copy)NSString *name;
@end
