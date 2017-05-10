//
//  ViewController.m
//  UIBlurEffect毛玻璃
//
//  Created by YY on 16/12/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBlurEffect *blurEffect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectview=[[UIVisualEffectView alloc]initWithEffect:blurEffect];
    effectview.frame=CGRectMake(0, 100, self.view.frame.size.width, 100);
    [self.view addSubview:effectview];
                      
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
