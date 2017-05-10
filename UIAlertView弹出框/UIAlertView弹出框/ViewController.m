//
//  ViewController.m
//  UIAlertView弹出框
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

#import <UserNotifications/UserNotifications.h>

@interface ViewController ()<UNUserNotificationCenterDelegate,UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
   
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    /*
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"123" message:@"qwe" delegate:self cancelButtonTitle:@"asd" otherButtonTitles:@"zxcv", @"cvb",@"ytu",nil];
    [alertView addButtonWithTitle:@"987"];
    alertView.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
    
    [alertView show];
    
    */
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"提示" message:@"输入密码" preferredStyle:UIAlertControllerStyleAlert];
//
   
    
//    __weak typeof(alertController) wAlertController = alertController;
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"111" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//         NSLog(@"------%@------",wAlertController.textFields.firstObject.text);
//        NSLog(@">>>>>----<<<<");
    }];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"222" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//         NSLog(@"+++++++%@++++++",wAlertController.textFields.firstObject.text);
//        NSLog(@">>>>>++++++<<<<");
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
//    输入框
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.secureTextEntry = YES;  // 密文形式显示
//        textField.text = @"12345";
//    }];
    [self presentViewController:alertController animated:YES completion:nil];
                                        
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSLog(@"+++++++++++");
}
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    NSLog(@"---------------");
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"+++++%ld++++",(long)buttonIndex);
    
}

-(void)alertViewCancel:(UIAlertView *)alertView
{

}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"弹出框已经消失时的事件");
}
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"弹出框即将消失时的事件");
}
-(void)didPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"弹出框已经消失");
}
-(void)willPresentAlertView:(UIAlertView *)alertView
{
    NSLog(@"弹出框即将消失");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
