//
//  BlockTest.m
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest
-(void)clickedCallBack:(CallBack)back{
    if (self.back) {
        self.back();
    }
}
@end
