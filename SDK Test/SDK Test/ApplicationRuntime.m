//
//  ApplicationRuntime.m
//  20160315APP
//
//  Created by yosemite on 16/5/17.
//  Copyright © 2016年 OrganizationName. All rights reserved.
//

#import "ApplicationRuntime.h"
#import <UIKit/UIColor.h>

@implementation ApplicationRuntime

ApplicationRuntime *ApplicationRuntimeObject;



- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dealloc {

}

+ (instancetype)currentRuntime {
//    如果存在返回
    if (ApplicationRuntimeObject) {
        return ApplicationRuntimeObject;
    }
//    不存在创建返回
    else {
        ApplicationRuntimeObject = [[ApplicationRuntime alloc] init];
        return ApplicationRuntimeObject;
    }
}
//  重置把ApplicationRuntimeObject对象置为空
- (void)reset {
    ApplicationRuntimeObject = nil;
}


@end



