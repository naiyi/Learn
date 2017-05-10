//
//  ViewController.m
//  单例
//
//  Created by YY on 2017/3/2.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "SingleInstance.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"+++%@+++++++++%@+++",[[SingleInstance shareInstance] text],[SingleInstance shareInstance]);
     SingleInstance *instance=[[SingleInstance alloc]init];
    SingleInstance *instance1=[[SingleInstance alloc]init];
    NSLog(@"---%@-----%@----",instance1,instance);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
