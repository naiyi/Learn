//
//  ViewController.m
//  学习使用Core Graphics框架
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "GraphicsView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GraphicsView *view=[[GraphicsView alloc]initWithFrame:CGRectMake(50, 100, 100, 300)];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
    
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    label.backgroundColor=[UIColor orangeColor];
//    [view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
