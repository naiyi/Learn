//
//  SingleInstance.h
//  单例
//
//  Created by YY on 2017/3/2.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleInstance : NSObject

+(instancetype)shareInstance;

@property (nonatomic,copy,readonly)NSString *text;

@end
