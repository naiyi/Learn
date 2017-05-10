//
//  ViewController.m
//  属性
//
//  Created by yosemite on 16/10/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()<UIAccelerometerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIDevice *device=[UIDevice currentDevice];
    NSLog(@"name=%@",device.name);
    NSLog(@"model=%@",device.model);
    NSLog(@"localizedmodel=%@",device.localizedModel);
    NSLog(@"systemName=%@",device.systemName);
    NSLog(@"systemVersion=%@",device.systemVersion);
    NSUUID *uuid=[NSUUID UUID];
    NSLog(@">>>>>%@<<<<<",uuid);
//    device.identifierForVendor
    NSLog(@">>>>>%@<<<<<",device.identifierForVendor);
    
    NSLog(@"Battery level: %0.2f", [[UIDevice currentDevice] batteryLevel] * 100);
    

    
//    NSArray *stateArray = [NSArray arrayWithObjects: @"Unknown", @"not plugged into a charging source", @"charging", @"full", nil];
    NSLog(@"Battery state: %ld",(long)[[UIDevice currentDevice] batteryState]);
    
    
//    3.传感器。
//    
//    启用接近传感器后，它检测前方是否存在一个大型物体，如果有，它会关闭屏幕，并发出一般性通知。当障碍物移走后，会重新打开屏幕。这可以防止在通知过程中，误用耳朵触碰按钮。
//    
//    还要防止一些保护套会影响传感器工作。
    
    
    
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
        CFShow((__bridge CFTypeRef)(dicInfo));
    
    NSString *strAppName = [dicInfo objectForKey:@"CFBundleDisplayName"];
    NSLog(@"App应用名称：%@", strAppName);
    
    NSString *strAppVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"App应用版本：%@", strAppVersion);
    
    NSString *strAppBuild = [dicInfo objectForKey:@"CFBundleVersion"];
    NSLog(@"App应用Build版本：%@", strAppBuild);
    
    
//    NSArray *languageArray = [NSLocale preferredLanguages];
//    NSString *language = [languageArray objectAtIndex:0];
//    NSLog(@"语言：%@", language);//en
//    
//    NSLocale *locale = [NSLocale currentLocale];
//    NSString *country = [locale localeIdentifier];
//    NSLog(@"国家：%@", country); //en_US
//    
//    NSLog(@"%@",locale.countryCode);
    
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // 监听有物品靠近还是离开
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
    
    
    
    CMMotionManager *motionmanager=[[CMMotionManager alloc]init];
    
    if (motionmanager.isAccelerometerAvailable) {
        NSLog(@"加速计可用");
    }
    motionmanager.accelerometerUpdateInterval=1/30;
    [motionmanager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        
    }];
    
//    UITabBar
//    UITabBarItem
//    UITabBarController
//    UIBarItem
    
//    UIBarButtonItem
//    UINavigationBar
//    UINavigationController
//    UINavigationItem
    
    
    
    
}

- (void)proximityStateDidChange
{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"有物品靠近");
    } else {
        NSLog(@"有物品离开");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
