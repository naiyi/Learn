//
//  Person.h
//  Msaonry
//
//  Created by yosemite on 16/10/13.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)BOOL sex;

@end
