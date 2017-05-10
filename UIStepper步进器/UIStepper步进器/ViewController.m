//
//  ViewController.m
//  UIStepper步进器
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
    self.view.backgroundColor=[UIColor whiteColor];
    UIStepper *stepper=[[UIStepper alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    stepper.continuous=YES;//若设置为YES，则长按会连续触发变化，若设置为NO，只有在按击结束后，才会触发。
    stepper.autorepeat=YES;//若设置为YES，则长按值会一直改变，若设置为NO，则一次点击只会改变一次值
    stepper.wraps=YES;//设置控制器的值是否循环(到达边界后，重头开始，默认为NO)
//    stepper.value=5;
    stepper.tag=0x100;
    
    stepper.minimumValue=0;//最小值
    stepper.maximumValue=10;//最大值
    stepper.stepValue=2;//步长
    stepper.tintColor=[UIColor cyanColor];
    [stepper setBackgroundImage:[UIImage imageNamed:@"123"] forState:UIControlStateNormal];//设置背景图片
//    UIImage *image=[stepper backgroundImageForState:UIControlStateNormal];//获取背景图片
//    stepper setDividerImage:<#(nullable UIImage *)#> forLeftSegmentState:<#(UIControlState)#> rightSegmentState:<#(UIControlState)#>
    [stepper addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stepper];
    
}
-(void)btnclicked
{
    UIStepper *stepper=[self.view viewWithTag:0x100];
    NSLog(@">>>>>>%f<<<<<",stepper.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
