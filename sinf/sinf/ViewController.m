//
//  ViewController.m
//  sinf
//
//  Created by yosemite on 16/10/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat arc= sinf(-M_PI/2);
    NSLog(@">>>>%f<<<<<",arc);
    NSLog(@"---浮点数取绝对值%f----",fabs(-3.14));
    NSLog(@"---向上取整%lf----",ceilf(3.5));
    NSLog(@"----向下取整%lf----",floorf(3.14));
    NSLog(@"---- 截取整数部分%lf-----",truncf(3.14));
    NSLog(@"---四舍五入%lf---",roundf(3.14));
    NSLog(@"----两数整出后的余数%lf---",fmodf(6, 3));
    NSLog(@"----最大值%lf----",fmaxf(3.14, 2));
    NSLog(@"---最小值%lf---",fminf(3,4));
    
    NSLog(@"---求坐标值的反正切值%lf---",atan2f(3, 6));
    NSLog(@"---正切值%lf--",tan(M_PI));
    NSLog(@"--求反双曲余弦值%lf--",acoshf(3));
    NSLog(@"---反双曲正弦值%lf---",asinhf(4));
    NSLog(@"---双曲余弦值%lf--",coshf(3));
    NSLog(@"---求自然数e的幂%lf---",expf(0));
    NSLog(@"---计算2的参数次方值%lf---",exp2f(3));
    NSLog(@"---以e为底的对数%lf---",logf(10));
    NSLog(@"---以10为底的对数%lf----",log10f(10));
    NSLog(@"求2的3次方%lf---",pow(2, 3));
    NSLog(@"--开平方%lf---",sqrt(16));
    NSLog(@"取余数%lf---",remainder(6, 13));
    int a=0;
    NSLog(@"%lf---",remquof(15, 5, &a));
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
