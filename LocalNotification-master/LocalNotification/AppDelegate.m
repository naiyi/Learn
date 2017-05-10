//
//  AppDelegate.m
//  LocalNotification
//
//  Created by long on 16/3/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import "AppDelegate.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [self registerLocalNotification];
    
    return YES;
}

//- (void)registerLocalNotification
//{
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
//        [self registeriOS10LocalNotification];
//    } else {
//        [self registeriOS8LocalNotification];
//    }
//}
//
//- (void)registeriOS10LocalNotification
//{
//    //iOS10特有
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    // 必须写代理，不然无法监听通知的接收与点击
//    center.delegate = self;
//    
//    /**
//     UNNotificationActionOptionAuthenticationRequired: 锁屏时需要解锁才能触发事件，触发后不会直接进入应用
//     UNNotificationActionOptionDestructive：字体会显示为红色，且锁屏时触发该事件不需要解锁，触发后不会直接进入应用
//     UNNotificationActionOptionForeground：锁屏时需要解锁才能触发事件，触发后会直接进入应用界面
//     */
//    UNNotificationAction *action1 = [UNNotificationAction actionWithIdentifier:kNotificationActionIdentifileStar title:@"赞" options:UNNotificationActionOptionAuthenticationRequired];
//    UNTextInputNotificationAction *action2 = [UNTextInputNotificationAction actionWithIdentifier:kNotificationActionIdentifileComment title:@"评论一下吧" options:UNNotificationActionOptionForeground textInputButtonTitle:@"评论" textInputPlaceholder:@"请输入评论"];
//    UNNotificationCategory *catetory = [UNNotificationCategory categoryWithIdentifier:kNotificationCategoryIdentifile actions:@[action1, action2] intentIdentifiers:@[kNotificationActionIdentifileStar, kNotificationActionIdentifileComment] options:UNNotificationCategoryOptionNone];
//    
//    [center setNotificationCategories:[NSSet setWithObject:catetory]];
//    
//    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (granted) {
//            //用户点击允许
//            NSLog(@"注册成功");
//            [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
//                NSLog(@"%@", settings);
//            }];
//        } else {
//            //用户点击不允许
//            NSLog(@"注册失败");
//        }
//    }];
//}
//
//- (void)registeriOS8LocalNotification
//{
//    //创建消息上面要添加的动作（iOS9才支持）
//    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
//    action1.identifier = kNotificationActionIdentifileStar;
//    action1.title = @"赞";
//    //当点击的时候不启动程序，在后台处理
//    action1.activationMode = UIUserNotificationActivationModeBackground;
//    //需要解锁才能处理(意思就是如果在锁屏界面收到通知，并且用户设置了屏幕锁，用户点击了赞不会直接进入我们的回调进行处理，而是需要用户输入屏幕锁密码之后才进入我们的回调)，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
//    action1.authenticationRequired = YES;
//    /*
//     destructive属性设置后，在通知栏或锁屏界面左划，按钮颜色会变为红色
//     如果两个按钮均设置为YES，则均为红色（略难看）
//     如果两个按钮均设置为NO，即默认值，则第一个为蓝色，第二个为浅灰色
//     如果一个YES一个NO，则都显示对应的颜色，即红蓝双色 (CP色)。
//     */
//    action1.destructive = NO;
//    
//    //第二个动作
//    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
//    action2.identifier = kNotificationActionIdentifileComment;
//    action2.title = @"评论";
//    //当点击的时候不启动程序，在后台处理
//    action2.activationMode = UIUserNotificationActivationModeBackground;
//    //设置了behavior属性为 UIUserNotificationActionBehaviorTextInput 的话，则用户点击了该按钮会出现输入框供用户输入
//    action2.behavior = UIUserNotificationActionBehaviorTextInput;
//    //这个字典定义了当用户点击了评论按钮后，输入框右侧的按钮名称，如果不设置该字典，则右侧按钮名称默认为 “发送”
//    action2.parameters = @{UIUserNotificationTextInputActionButtonTitleKey: @"评论"};
//    
//    //创建动作(按钮)的类别集合
//    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
//    //这组动作的唯一标示
//    category.identifier = kNotificationCategoryIdentifile;
//    //最多支持两个，如果添加更多的话，后面的将被忽略
//    [category setActions:@[action1, action2] forContext:(UIUserNotificationActionContextMinimal)];
//    //创建UIUserNotificationSettings，并设置消息的显示类类型
//    UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:[NSSet setWithObject:category]];
//    
//    [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
//}

#pragma mark - iOS10 接收推送的两个方法
/**
 本地和远程推送合为一个，通过 response.notification.request.trigger 来区分
 1.UNPushNotificationTrigger （远程通知） 远程推送的通知类型
 
 2.UNTimeIntervalNotificationTrigger （本地通知） 一定时间之后，重复或者不重复推送通知。我们可以设置timeInterval（时间间隔）和repeats（是否重复）。
 
 3.UNCalendarNotificationTrigger（本地通知） 一定日期之后，重复或者不重复推送通知 例如，你每天8点推送一个通知，只要dateComponents为8，如果你想每天8点都推送这个通知，只要repeats为YES就可以了。
 
 4.UNLocationNotificationTrigger （本地通知）地理位置的一种通知，
 当用户进入或离开一个地理区域来通知。在CLRegion标识符必须是唯一的。因为如果相同的标识符来标识不同区域的UNNotificationRequests，会导致不确定的行为。
 */
//接收到通知的事件
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
//{
//    //这个和下面的userNotificationCenter:didReceiveNotificationResponse withCompletionHandler: 处理方法一样
//    NSDictionary *userInfo = notification.request.content.userInfo;
//    //收到推送的请求
//    UNNotificationRequest *request = notification.request;
//    //收到推送的内容
//    UNNotificationContent *content = request.content;
//    NSNumber *badge = content.badge;
//    NSString *body = content.body;
//    NSString *title = content.title;
//    NSString *subTitle = content.subtitle;
//    UNNotificationSound *sound = content.sound;
//    
//    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        NSLog(@"iOS10 前台收到远程通知:%@", userInfo);
//    } else {
//        // 判断为本地通知
//        NSLog(@"iOS10 应用在前台收到本地通知:{\\\\nbody:%@，\\\\ntitle:%@,\\\\nsubtitle:%@,\\\\nbadge：%@，\\\\nsound：%@，\\\\nuserInfo：%@\\\\n}", body, title, subTitle, badge, sound, userInfo);
//    }
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
//}
//
////通知的点击事件
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
//{
//    NSDictionary *userInfo = response.notification.request.content.userInfo;
//    //收到推送的请求
//    UNNotificationRequest *request = response.notification.request;
//    //收到推送的内容
//    UNNotificationContent *content = request.content;
//    NSNumber *badge = content.badge;
//    NSString *body = content.body;
//    NSString *title = content.title;
//    NSString *subTitle = content.subtitle;
//    UNNotificationSound *sound = content.sound;
//    
//    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        NSLog(@"iOS10 前台收到远程通知:%@", userInfo);
//    } else {
//        // 判断为本地通知
//        NSLog(@"iOS10 应用在后台点击推送消息收到本地通知:{\\\\nbody:%@，\\\\ntitle:%@,\\\\nsubtitle:%@,\\\\nbadge：%@，\\\\nsound：%@，\\\\nuserInfo：%@\\\\n}", body, title, subTitle, badge, sound, userInfo);
//    }
//    NSString *actionIdentifile = response.actionIdentifier;
//    if ([actionIdentifile isEqualToString:kNotificationActionIdentifileStar]) {
//        [self showAlertView:@"点了赞"];
//    } else if ([actionIdentifile isEqualToString:kNotificationActionIdentifileComment]) {
//        [self showAlertView:[(UNTextInputNotificationResponse *)response userText]];
//    }
//    
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
//}

#pragma mark - iOS9 及之前方法
// (iOS9及之前)本地通知回调函数，当应用程序在前台时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
//    [self showAlertView:@"用户没点击按钮直接点的推送消息进来的/或者该app在前台状态时收到推送消息"];
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge -= notification.applicationIconBadgeNumber;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    
}

//在非本App界面时收到本地消息，下拉消息会有快捷回复的按钮，点击按钮后调用的方法，根据identifier来判断点击的哪个按钮，notification为消息内容
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    if ([identifier isEqualToString:kNotificationActionIdentifileStar]) {
        [self showAlertView:@"点了赞"];
    } else if ([identifier isEqualToString:kNotificationActionIdentifileComment]) {
        [self showAlertView:[NSString stringWithFormat:@"用户评论为:%@", responseInfo[UIUserNotificationActionResponseTypedTextKey]]];
    }
    
    completionHandler(UIUserNotificationTypeSound|UIUserNotificationTypeBadge|UIUserNotificationTypeAlert);
}

- (void)showAlertView:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self.window.rootViewController showDetailViewController:alert sender:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
