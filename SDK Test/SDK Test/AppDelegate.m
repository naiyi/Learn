//
//  AppDelegate.m
//  SDK Test
//
//  Created by YY on 2017/4/28.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "AppDelegate.h"
#import "SnapWiFiSDK.h"
@interface AppDelegate ()
@property (nonatomic,assign)UIBackgroundTaskIdentifier task;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[SnapWiFiSDK shareWiFiInfo] registerSDKServiceWithKey:@"e270c8272cf4c3786da083440Da2577fip"];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    self.task=[application beginBackgroundTaskWithExpirationHandler:^{
        
        
        [application endBackgroundTask:self.task];
        self.task=UIBackgroundTaskInvalid;
    }];
    if (self.task==UIBackgroundTaskInvalid) {
//        NSLog(@"failed to start background task!");
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSTimeInterval timeRemain=0;
        do {
            [NSThread sleepForTimeInterval:5];
            if (self.task!=UIBackgroundTaskInvalid) {
                timeRemain=[application backgroundTimeRemaining];
//                NSLog(@"Time remaining: %f",timeRemain);
            }
        } while (self.task!=UIBackgroundTaskInvalid &&timeRemain>0);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.task!=UIBackgroundTaskInvalid) {
                [application endBackgroundTask:self.task];
                self.task=UIBackgroundTaskInvalid;
            }
        });
    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    if (self.task!=UIBackgroundTaskInvalid) {
        [application endBackgroundTask:self.task];
        self.task=UIBackgroundTaskInvalid;
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
