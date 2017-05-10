//
//  ViewController.m
//  定位Demo
//
//  Created by YY on 2017/1/5.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
//#import <CoreLocation/CLLocationManager.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager *manager;
@property (nonatomic,strong)CLGeocoder *geocoder;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager=[[CLLocationManager alloc]init];
    self.manager.desiredAccuracy=kCLLocationAccuracyBest;
    self.manager.distanceFilter=10.0f;
    self.manager.delegate=self;
    
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined) {
        [self.manager requestAlwaysAuthorization];
    }
    
    _btn=[UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame=CGRectMake(0, 100, self.view.frame.size.width, 40);
    _btn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [_btn setTitle:@"定位" forState:UIControlStateNormal];
    _btn.backgroundColor=[UIColor orangeColor];
    _btn.titleLabel.font=[UIFont systemFontOfSize:12];
    [_btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    
}

-(void)btnClicked:(UIButton*)btn{
    if ([CLLocationManager locationServicesEnabled]) {
        [self.manager startUpdatingLocation];
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"__%@__",locations);
    CLLocation *loc=[locations firstObject];
    NSLog(@"+++++%@++++",loc);
    self.geocoder=[[CLGeocoder alloc]init];
    [self.geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark=[placemarks objectAtIndex:0];
        NSString *str=[NSString stringWithFormat:@"%@%@%@%@",placemark.locality,placemark.subLocality,placemark.thoroughfare,placemark.name];
        [_btn setTitle:str forState:UIControlStateNormal];
        NSLog(@"----%@----%@------%@----%@----%@-----%@----%@----%@-----",placemark.name,placemark.administrativeArea,placemark.locality,placemark.thoroughfare,placemark.subThoroughfare,placemark.postalCode,placemark.subLocality,placemark.country);
    }];
    [manager stopUpdatingLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
