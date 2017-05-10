//
//  ViewController.m
//  FirstAPP
//
//  Created by YY on 2017/4/18.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()
{
    int a;//成员变量，不会生成get set 方法
    NextViewController *nextVC;//实例变量
}
@property (nonatomic,copy)void (^block)();//属性

@end
int b;//全局变量，未初始化，
NSString *name=@"young";//全局变量，初始化
//static float f;//静态变量
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    栈区：由编译器分配和释放，存放局部变量和函数的参数址。是向低地址扩展的数据结构。是一块连续的内存区域，
//    堆区：由程序猿分配和释放。如果程序猿不释放，在程序运行结束后系统自动释放。是向高地址扩展的数据结构。是不连续的内存区域，系统用链表来存储空闲的内存地址
    
    self.view.backgroundColor=[UIColor orangeColor];
//    int value=10;//局部变量，存储在栈区
   

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    NSURL *url=[NSURL URLWithString:@"SecondAPP://page1?FirstAPP"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
