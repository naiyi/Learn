//
//  Person.h
//  Nsarray
//
//  Created by yosemite on 16/9/21.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,strong)NSString *name;
+(instancetype)personWithName:(NSString *)name;
@end
