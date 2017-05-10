//
//  ViewController.m
//  lastObject
//
//  Created by yosemite on 16/9/22.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSLog(@"---%@---",[arr firstObject]);
    NSLog(@"+++%@+++",[arr lastObject]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
