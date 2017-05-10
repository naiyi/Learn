//
//  ViewController.m
//  两个经纬度之间的距离
//
//  Created by YY on 2017/3/23.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:31.204689 longitude:121.466773] ;
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:31.2049356  longitude:121.46649987];
    CLLocationDistance kilometers = [location1 distanceFromLocation:location2];
    NSLog(@"----%f----",kilometers);
    
    
    
//    NSArray *arr=@[];
//    for (NSString *str in arr) {
 //   if (kilometers<100) {
            
   //     }
    //}
}
-(double)getDistanceMeters:(double)latitude1 :(double) longitude1 :(double)latitude2 :(double)longitute2{
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:latitude1 longitude:longitude1] ;
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:latitude2  longitude:longitute2];
    CLLocationDistance kilometers = [location1 distanceFromLocation:location2];
    return kilometers;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
