//
//  Person.m
//  Msaonry
//
//  Created by yosemite on 16/10/13.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super init]) {
        self.age=[aDecoder decodeIntegerForKey:@"age"];
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.sex=[aDecoder decodeBoolForKey:@"sex"];
    }
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeBool:self.sex forKey:@"sex"];
    
}
@end
