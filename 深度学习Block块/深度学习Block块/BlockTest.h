//
//  BlockTest.h
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CallBack)();
@interface BlockTest : NSObject
@property (nonatomic,assign)CallBack back;

-(void)clickedCallBack:(CallBack)back;

@end
