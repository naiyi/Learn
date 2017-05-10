//
//  ViewController.m
//  UIImageView
//
//  Created by yosemite on 16/9/9.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image=[UIImage imageNamed:@"1"];
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    UILabel *label=[[UILabel alloc]initWithFrame:imageView.frame];
    label.text=@"1";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:label];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked:)];
    imageView.userInteractionEnabled=YES;
    [imageView addGestureRecognizer:tap];
}
-(void)tapClicked:(UITapGestureRecognizer *)tap
{
    NSLog(@"+++++");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
