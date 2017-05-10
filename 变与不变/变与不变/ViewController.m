//
//  ViewController.m
//  变与不变
//
//  Created by YY on 2017/2/10.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
static int i=0;
@interface ViewController ()
{
//    int i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 50, 40);
    btn.backgroundColor=[UIColor cyanColor];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClicked:(UIButton *)btn{
    i=i+1;
    NSLog(@"i==%i",i);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
