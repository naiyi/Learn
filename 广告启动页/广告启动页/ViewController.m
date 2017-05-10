//
//  ViewController.m
//  广告启动页
//
//  Created by DFSJ on 17/2/9.
//  Copyright © 2017年 Oriental Horizon. All rights reserved.
//

#import "ViewController.h"
#import "PAdvertiseView.h"
#import "ADViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"首页";

    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(40, 50, 100, 120)];
    view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:view];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
