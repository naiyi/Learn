//
//  ApplicationRuntime.h
//  20160315APP
//
//  Created by yosemite on 16/5/17.
//  Copyright © 2016年 OrganizationName. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>
@interface ApplicationRuntime : NSObject


@property (nonatomic,assign)double connectedData;

@property (nonatomic,assign)double currentData;

@property (nonatomic,assign)NSTimeInterval conncetedTime;

@property (nonatomic,assign)NSTimeInterval currentTime;

@property (nonatomic,copy)CLLocation *currentLocation;

@property (nonatomic,assign)NSTimeInterval breakTime;

@property (nonatomic,assign)double verticalAccuracy;

@property (nonatomic,copy)NSString *pingUrlStr;

@property (nonatomic,copy)NSString *AESOffset;

@property (nonatomic,copy)NSString *AESKey;

//  当前时间
+ (instancetype)currentRuntime;
//  重置
- (void)reset;

@end



#define MAKE_WEAK_OBJECT(weakObject, object) __weak __typeof(object) weakObject = object
