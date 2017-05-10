//
//  ViewController.m
//  UI4_自定义大头针
//
//  Created by zhangxueming on 16/4/6.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
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
    [_locationManager requestWhenInUseAuthorization];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.mapType = MKMapTypeStandard;
    
    [self.view addSubview:_mapView];
    
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    _mapView.delegate = self;
    
    
    XMAnnotation *annotation1= [[XMAnnotation alloc] init];
    annotation1.coordinate = CLLocationCoordinate2DMake(34.75690000, 113.68758765);
    annotation1.title = @"郑州";
    annotation1.subtitle = @"金水区紫荆山路";
    annotation1.image = [UIImage imageNamed:@"icon_pin"];
    //34.75690887,+113.68757765
    XMAnnotation *annotation2 = [[XMAnnotation alloc] init];
    annotation2.coordinate = CLLocationCoordinate2DMake(34.75956887, 113.68756765);
    annotation2.title = @"郑州";
    annotation2.subtitle = @"管城区东里路";
    annotation2.image = [UIImage imageNamed:@"icon_pin"];
    
    [_mapView addAnnotations:@[annotation1,annotation2]];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@", userLocation.location);
    
}

//添加大头针,会调用这个方法
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[XMAnnotation class]])
    {
        //创建一个自定义的大头针视图并返回
        MKAnnotationView *annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"reuseAnnotation"];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"reuseAnnotation"];
            //设置详情视图的偏移
            annotationView.calloutOffset = CGPointMake(0, 5);
//            annotationView.annotation = annotation;
            
            annotationView.canShowCallout = YES;
            //设置大头针的视图
            annotationView.image = ((XMAnnotation *)annotation).image;
        }
        
        annotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_classify"]];
        
        return annotationView;
    }
    return nil;//使用系统默认的大头针
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
