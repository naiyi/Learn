//
//  ViewController.m
//  AVPlayer
//
//  Created by yosemite on 16/10/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "PlayViewViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor cyanColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 150, 30);
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnClicked
{
    PlayViewViewController *playVC=[[PlayViewViewController alloc]init];
    [self presentViewController:playVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
