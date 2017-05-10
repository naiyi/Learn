//
//  ViewController.m
//  UI1_定位
//
//  Created by zhangxueming on 16/4/6.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>

//包含GPS定位信息

@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //判断定位功能是否使能
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务启用");
    }
    else
    {
        NSLog(@"定位服务未启动");
    }
    
    _locationManager= [[CLLocationManager alloc] init];
    //判断授权状态
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    
    //设置为kCLDistanceFilterNone, 位置每一秒钟更新一次
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置代理
    _locationManager.delegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 200, self.view.frame.size.width-200, 50);
    [btn setTitle:@"开始定位" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 300, self.view.frame.size.width-200, 50);
    [btn2 setTitle:@"停止定位" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(stopLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)startLocation:(UIButton *)btn
{
    //开始定位
    [_locationManager startUpdatingLocation];
}

- (void)stopLocation:(UIButton *)btn
{
    //停止定位
    [_locationManager stopUpdatingLocation];
}

#pragma mark  ---CLLocationManagerDelegate---


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"===========");
    
    CLLocation *location = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    NSLog(@"latitude = %f longitude = %f",coordinate.latitude,coordinate.longitude);
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    NSLog(@"%@",error);
}


- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"进入到某个区域");
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"退出某个区域");
}

- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
    NSLog(@"暂停位置更新");
}

- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
    NSLog(@"恢复位置更新");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
