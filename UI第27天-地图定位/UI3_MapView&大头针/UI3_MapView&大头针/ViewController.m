//
//  ViewController.m
//  UI3_MapView&大头针
//
//  Created by zhangxueming on 16/4/6.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKMapView.h>
#import "XMAnnotation.h"

@interface ViewController ()<MKMapViewDelegate>
{
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc] init];
    //请求授权
    [_locationManager requestWhenInUseAuthorization];
    //_locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //创建地图
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    
    //设置地图风格
    _mapView.mapType = MKMapTypeStandard;
    
    //设置用户追踪风格
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    //显示用户位置
    _mapView.showsUserLocation = YES;
    
    //设置代理
    _mapView.delegate =self;
    
    //+34.75690887,+113.68757765
    //创建大头针
    XMAnnotation *annotation1 = [[XMAnnotation alloc] init];
    annotation1.title = @"郑州";
    annotation1.subtitle = @"紫荆山路城东路";
    annotation1.coordinate = CLLocationCoordinate2DMake(34.75690000, 113.68757120);
    [_mapView addAnnotation:annotation1];
    
    XMAnnotation *annotation2 = [[XMAnnotation alloc] init];
    annotation2.title = @"郑州";
    annotation2.subtitle = @"商城路紫荆山路";
    annotation2.coordinate = CLLocationCoordinate2DMake(34.75610000, 113.68750000);
    [_mapView addAnnotation:annotation2];
    
    
//    //创建显示的范围
//    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
//    
//    MKCoordinateRegion region = MKCoordinateRegionMake(annotation2.coordinate,span);
//    
//    //设置地图显示的区域
//    [_mapView setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@", userLocation.location);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
