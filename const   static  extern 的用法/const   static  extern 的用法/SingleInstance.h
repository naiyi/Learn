//
//  SingleInstance.h
//  const   static  extern 的用法
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleInstance : NSObject


//  单例
+(SingleInstance *)shareManager;
@end
