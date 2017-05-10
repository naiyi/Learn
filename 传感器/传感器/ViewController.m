//
//  ViewController.m
//  传感器
//
//  Created by YY on 2017/5/3.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 1开启距离感应功能
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    // 2监听距离感应的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(proximityChange:)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
    
    
}

-(void)proximityChange:(NSNotificationCenter *)notification {
    if ([UIDevice currentDevice].proximityState == YES) {
        NSLog(@"某个物体靠近了设备屏幕"); // 屏幕会自动锁住
    } else {
        NSLog(@"某个物体远离了设备屏幕"); // 屏幕会自动解锁
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
