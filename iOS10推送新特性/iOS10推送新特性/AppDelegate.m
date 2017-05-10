//
//  AppDelegate.m
//  iOS10推送新特性
//
//  Created by yosemite on 16/10/19.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "AppDelegate.h"

#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=10) {
//        UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
//        center.delegate=self;
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
//            if (granted) {
//                NSLog(@"注册成功");
//            }else{
//                NSLog(@"注册失败");
//            }
//        }];
//    }else if ([[[UIDevice currentDevice] systemVersion]floatValue]>8.0){
//        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:nil]];
//    }else{
//        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound];
//    }
    UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
    center.delegate=self;
//    注册获得授权
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound+UNAuthorizationOptionAlert+UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"+++++++++++++");
        }else
        {
            NSLog(@"---------------");
        }
        
        
    }];
//    获取当前的通知设置   只读对象
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        
    }];
//    要本地推送的内容
    UNMutableNotificationContent *content=[[UNMutableNotificationContent alloc]init];
    content.title=[NSString localizedUserNotificationStringForKey:@"hello" arguments:nil];
    content.body=[NSString localizedUserNotificationStringForKey:@"hello world" arguments:nil];
    content.sound=[UNNotificationSound defaultSound];
    content.badge=@2;
//    多久后推送
    UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2 repeats:NO];
    
    UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:@"ads" content:content trigger:trigger];
//    推送后处理
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        UIAlertController *alertCon=[UIAlertController alertControllerWithTitle:@"本地推送" message:@"该起床了" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cannelAction=[UIAlertAction actionWithTitle:@"正确" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//        }];
//        [alertCon addAction:cannelAction];
//        
//        
//        
//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertCon animated:YES completion:nil];
    }];
    
    return YES;
}
//  获取token
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [deviceToken description]; //获取
    
    token =  [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token =  [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token =  [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    NSLog(@"request notificatoin token success. %@",token);
}
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{

}
//  在展示通知前进行处理，即有机会在展示通知前再修改通知内容。App在前台获取通知
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    UNNotificationContent *content =  notification.request.content;
    NSDictionary *userInfo = content.userInfo;
    
    [self handleRemoteNotificationContent:userInfo];
    
    //可以执行设置 弹窗 和 声音
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
}
//点击通知进入App
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    UNNotificationContent *content  = response.notification.request.content;
    NSDictionary *userInfo = content.userInfo;
    
    [self handleRemoteNotificationContent:userInfo];
    
    completionHandler();
}

- (void)handleRemoteNotificationContent:(NSDictionary *)userInfo
{
    NSLog(@" iOS 10 after Notificatoin message:\n %@",userInfo);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"iOS10_____"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
