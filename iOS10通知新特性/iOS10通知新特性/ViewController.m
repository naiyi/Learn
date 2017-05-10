//
//  ViewController.m
//  iOS10通知新特性
//
//  Created by yosemite on 16/9/26.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<UNUserNotificationCenterDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
//    center.delegate=self;
//   [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        
//    }];
//    NSString *requestIdentifier = @"sampleRequest";
////    删除推送：
//    [center removePendingNotificationRequestsWithIdentifiers:@[requestIdentifier]];
    
    UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];

    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert|UNAuthorizationOptionSound|UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];
    [[UIApplication sharedApplication]registerForRemoteNotifications];
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"+++%@+++",settings);
    }];
    UNMutableNotificationContent *content=[[UNMutableNotificationContent alloc]init];
    content.title=@"1234";
    content.subtitle=@"qwerty";
    content.body=@"['/.,m,;";
    content.badge=@1;
    NSLog(@"---%@---",content);
    
    UNTimeIntervalNotificationTrigger *trigger1=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
//    UNTimeIntervalNotificationTrigger *trigger2=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3600 repeats:YES];
    NSDateComponents *components=[[NSDateComponents alloc]init];
    components.weekday=3;
    components.hour=10;
    components.minute=29;
//    UNCalendarNotificationTrigger *trigger3=[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    
//    CLRegion *region=[[CLRegion alloc]init];
//    UNLocationNotificationTrigger *trigger4=[UNLocationNotificationTrigger triggerWithRegion:region repeats:YES];
    NSString *requestIdentifier=@"inentifier.organization.iOS10-----";
    UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:trigger1];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
    }];

//
//    UILocalNotification *localNotification=[[UILocalNotification alloc]init];
//    
//    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:10];
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    formatter.dateFormat=@"HH:mm:ss";
////    NSData *time=[formatter dateFromString:@"15:00:00"];
//    localNotification.fireDate=date;
//    localNotification.timeZone=[NSTimeZone defaultTimeZone];
//    localNotification.repeatInterval=NSCalendarUnitDay;
//    localNotification.soundName=UILocalNotificationDefaultSoundName;
//    localNotification.alertBody=@"qaqaqawer";
//    localNotification.alertTitle=@"1234";
//    localNotification.applicationIconBadgeNumber=2;
//    localNotification.userInfo=[NSDictionary dictionaryWithObjectsAndKeys:@"name",@"key", nil];
//    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    
    
    
    
}

//    App 处于前台时捕捉并处理即将触发的推送：
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    completionHandler(UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound);
}
//    收到通知响应时的处理工作。用户与你推送的通知进行交互时被调用：
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    completionHandler();
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
