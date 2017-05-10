//
//  STDPingServices.h
//  STKitDemo
//
//  Created by SunJiangting on 15-3-9.
//  Copyright (c) 2015年 SunJiangting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "YYSimplePing.h"

typedef NS_ENUM(NSInteger, YYPingStatus) {
    YYPingStatusDidStart,
    YYPingStatusDidFailToSendPacket,
    YYPingStatusDidReceivePacket,
    YYPingStatusDidReceiveUnexpectedPacket,
    YYPingStatusDidTimeout,
    YYPingStatusError,
    YYPingStatusFinished,
};

@interface YYPingItem : NSObject

@property(nonatomic) NSString *originalAddress;
@property(nonatomic, copy) NSString *IPAddress;

@property(nonatomic) NSUInteger dateBytesLength;
@property(nonatomic) double     timeMilliseconds;
@property(nonatomic) NSInteger  timeToLive;
@property(nonatomic) NSInteger  ICMPSequence;

@property(nonatomic) YYPingStatus status;

+ (NSString *)statisticsWithPingItems:(NSArray *)pingItems;

@end

@interface YYPingServices : NSObject

/// 超时时间, default 500ms
@property(nonatomic) double timeoutMilliseconds;

+ (YYPingServices *)startPingAddress:(NSString *)address
                      callbackHandler:(void(^)(YYPingItem *pingItem, NSArray *pingItems))handler;

@property(nonatomic) NSInteger  maximumPingTimes;
- (void)cancel;

@end
