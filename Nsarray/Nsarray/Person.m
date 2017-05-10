//
//  Person.m
//  Nsarray
//
//  Created by yosemite on 16/9/21.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "Person.h"

@implementation Person
+(instancetype)personWithName:(NSString *)name
{
    Person *p=[[Person alloc]init];
    p.name=name;
    return p;
}
@end
