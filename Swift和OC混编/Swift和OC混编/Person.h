//
//  Person.h
//  Swift和OC混编
//
//  Created by yosemite on 16/10/17.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Swift和OC混编-swift.h"    //oc调用swift的类需要导入头文件名    格式： #import "名字-swift.h"
@interface Person : NSObject
{
    Student *s;
}
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)NSInteger sex;

@end
