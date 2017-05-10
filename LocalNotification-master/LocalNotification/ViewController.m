//
//  ViewController.m
//  LocalNotification
//
//  Created by long on 16/3/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

#define kLocalNotificationKey @"kLocalNotificationKey"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnSendLocalNotification_Click:(id)sender
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        [self sendiOS10LocalNotification];
    } else {
        [self sendiOS8LocalNotification];
    }
}

- (void)sendiOS10LocalNotification
{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.body = @"Body:夏目友人帐";
    content.badge = @(1);
    content.title = @"Title:夏目·贵志";
    content.subtitle = @"SubTitle:三三";
    content.categoryIdentifier = kNotificationCategoryIdentifile;
    content.userInfo = @{kLocalNotificationKey: @"iOS10推送"};
    //    content.launchImageName = @"xiamu";
    //推送附件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"0" ofType:@"mp4"];
    NSError *error = nil;
    UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"AttachmentIdentifile" URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    content.attachments = @[attachment];
    
    //推送类型
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Test" content:content trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"iOS 10 发送推送， error：%@", error);
    }];
}

- (void)sendiOS8LocalNotification
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    //触发通知时间
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //重复间隔
    //    localNotification.repeatInterval = kCFCalendarUnitMinute;
//    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    //通知内容
    localNotification.alertBody = @"i am a test local notification";
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    //通知参数
//    localNotification.userInfo = @{kLocalNotificationKey: @"iOS8推送"};
//    
//    localNotification.category = kNotificationCategoryIdentifile;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (IBAction)btnCancelSend_Click:(id)sender
{
    for (UILocalNotification *obj in [UIApplication sharedApplication].scheduledLocalNotifications) {
        if ([obj.userInfo.allKeys containsObject:kLocalNotificationKey]) {
            [[UIApplication sharedApplication] cancelLocalNotification:obj];
        }
    }
    //直接取消全部本地通知
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
