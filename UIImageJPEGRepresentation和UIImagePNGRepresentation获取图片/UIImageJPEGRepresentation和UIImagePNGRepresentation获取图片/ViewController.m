//
//  ViewController.m
//  UIImageJPEGRepresentation和UIImagePNGRepresentation获取图片
//
//  Created by yosemite on 16/10/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image=[UIImage imageNamed:@"87.png"];
    NSData *data=UIImageJPEGRepresentation(image, 1);
    NSLog(@">>>>>%@<<<<",data);
    
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    UIWindow *windon=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UIApplication *application=[UIApplication sharedApplication];
    application.networkActivityIndicatorVisible=YES;//状态栏显示网络旋转的齿轮默认是no
    application.statusBarStyle=UIStatusBarStyleLightContent;//状态栏风格
    application.statusBarHidden=YES;//是否隐藏状态栏
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
