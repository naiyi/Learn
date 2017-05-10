//
//  SeconViewController.m
//  iOS传值
//
//  Created by yosemite on 16/9/14.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "SeconViewController.h"
#import "ViewController.h"
@interface SeconViewController ()
{
    UITextField *_textField;
}
@end

@implementation SeconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200,30)];
    _textField.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_textField];
   
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 200, 100, 50);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)returnText:(passTextBlock)block
{
    self.textBlock=block;
}
//  视图将要消失的时候判断是否实现代理方法
//-(void)viewWillDisappear:(BOOL)animated
//{
////
//    if (self.delegate&&[self.delegate respondsToSelector:@selector(PassTextValue:)]) {
//        [self.delegate PassTextValue:_textField.text];
//    }
//    
////    block 传值
//    if (self.textBlock!=nil) {
//        self.textBlock(_textField.text);
//    }
//    
//}
-(void)btnClicked:(UIButton *)btn
{

//   注册通知
    NSNotification *notification=[NSNotification notificationWithName:@"notification" object:self userInfo:@{@"text":_textField.text}];
//     发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    
//     [[NSNotificationCenter defaultCenter]postNotificationName:@"notification" object:self userInfo:@{@"text":_textField.text}];
    [self.navigationController popViewControllerAnimated:YES];
    
//    单例传值
//    ViewController *viewVC=[ViewController shareInstance];
//    if (_textField.text!=nil) {
//         viewVC.value1=_textField.text;
//    }else
//    {
//        viewVC.value1=nil;
//    }
//   
//    [self.navigationController pushViewController:viewVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
