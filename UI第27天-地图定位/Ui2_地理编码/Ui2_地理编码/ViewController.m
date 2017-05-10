//
//  ViewController.m
//  Ui2_地理编码
//
//  Created by zhangxueming on 16/4/6.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>

//地理逆编码:把位置信息(经纬度)转换成实际的地理位置(市,区,街道)
//地理编码:把实际的地址位置转换成经纬度坐标

@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    CLGeocoder *_geocoder;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedAlways) {
        [_locationManager requestAlwaysAuthorization];
    }
    
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _locationManager.delegate = self;
    
    
    //地理编码的方法
    _geocoder = [[CLGeocoder alloc] init];
    
    [self geocodeAddressWithString:@"郑州,紫荆山"];
//    [self reverseGeocodeWithLatitude:34.74998900 longitude:113.68628700];
}

//- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler;

- (void)geocodeAddressWithString:(NSString *)address
{
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"count = %li",placemarks.count);
        CLPlacemark *placemark = [placemarks firstObject];
        NSLog(@"location = %@", placemark.location);
        NSLog(@"address = %@", placemark.addressDictionary);
    }];
}

//地理反编码
//- (void)reverseGeocodeLocation:(CLLocation *)location completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (void)reverseGeocodeWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        NSLog(@"count = %li", placemarks.count);
        CLPlacemark *placemark = [placemarks firstObject];
        NSLog(@"%@",placemark.addressDictionary[@"Name"]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
