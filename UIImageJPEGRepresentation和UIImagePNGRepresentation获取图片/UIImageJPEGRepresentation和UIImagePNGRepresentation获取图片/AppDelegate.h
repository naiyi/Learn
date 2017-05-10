//
//  AppDelegate.h
//  UIImageJPEGRepresentation和UIImagePNGRepresentation获取图片
//
//  Created by yosemite on 16/10/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

