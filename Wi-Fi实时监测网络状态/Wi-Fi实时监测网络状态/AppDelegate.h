//
//  AppDelegate.h
//  Wi-Fi实时监测网络状态
//
//  Created by YY on 2017/2/17.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

