//
//  AppDelegate.h
//  获取设备的ip地址
//
//  Created by YY on 16/11/4.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

