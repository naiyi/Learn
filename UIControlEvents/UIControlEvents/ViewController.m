//
//  ViewController.m
//  UIControlEvents
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(100, 100, 100, 50);
    btn.backgroundColor=[UIColor redColor];
    btn.center=CGPointMake(self.view.frame.size.width/2, 200);
    [btn setTitle:@"测试" forState:UIControlStateNormal];
//    UIControlEventTouchDown按下去立即触发点击事件
//    UIControlEventTouchUpInside按下去松开的时候立即出发点击事件
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)btnClicked:(UIButton *)btn
{
    NSLog(@"----------");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
