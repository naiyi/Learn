//
//  ViewController.m
//  arc4random_uniform(x)取随机数
//
//  Created by yosemite on 16/10/8.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSInteger a=arc4random_uniform(x);
//    a的取值范围是0～x-1
//    NSLog(@"++++%li+++++",a);
    NSInteger a=arc4random()%5;
    NSLog(@"---%li---",(long)a);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
