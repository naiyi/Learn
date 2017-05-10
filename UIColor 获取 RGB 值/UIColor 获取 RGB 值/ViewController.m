//
//  ViewController.m
//  UIColor 获取 RGB 值
//
//  Created by YY on 2017/5/3.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

//  内联函数  两点之间的距离
static __inline__ CGFloat CGPointDistanceBetweenTwoPoints(CGPoint point1, CGPoint point2) { CGFloat dx = point2.x - point1.x; CGFloat dy = point2.y - point1.y; return sqrt(dx*dx + dy*dy);}


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *color=[UIColor colorWithRed:1 green:0.3 blue:0 alpha:1];
    const CGFloat *components=CGColorGetComponents(color.CGColor);
    NSLog(@"Red: %f", components[0]);
    NSLog(@"Green: %f", components[1]);
    NSLog(@"Blue: %f", components[2]);
    NSLog(@"Alpha: %f", components[3]);
    
    
    NSLog(@"----%f----",CGPointDistanceBetweenTwoPoints(CGPointMake(1, 5), CGPointMake(4, 6)));
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}































@end
