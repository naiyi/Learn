//
//  YYDownloadManager.h
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^YYDownloadHandler)(NSData *receiveData,NSError *error);
typedef void (^YYDownloadProgressHandler)(CGFloat progress);

typedef void(^CallBack)();
@interface YYDownloadManager : NSObject


+(void)downloadWithURL:(NSString *)URL parameters:(NSDictionary *)para handler:(YYDownloadHandler)handler progress:(YYDownloadProgressHandler)progress;



@end
