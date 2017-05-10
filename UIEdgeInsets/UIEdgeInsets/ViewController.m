//
//  ViewController.m
//  UIEdgeInsets
//
//  Created by yosemite on 16/10/11.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"首页" ;
    self.navigationController.navigationBar.barTintColor=[UIColor cyanColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 150, 60);
    btn.backgroundColor=[UIColor cyanColor];
    NSLog(@">>>>%@<<<<",btn.titleLabel.font);
    
    [btn setTitle:@"点击一下" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"详细信息图标"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(8, 50, 38, 10)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(25, 0, 11, 50)];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
//    UIOffsetMake(<#CGFloat horizontal#>, <#CGFloat vertical#>)偏移
//    UIRectEdge
//    UINavigationBar
    CATransform3D
    
}
-(void)btnClicked:(UIButton *)btn
{
    NSLog(@"++++++++");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
