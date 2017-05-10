//
//  ContactViewController.m
//  UITabBarController标签栏控制器
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ContactViewController.h"
#import "PopupView.h"
@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
//    self.title=@"通讯录";
//    self.navigationItem.title=@"通讯录";
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    view.backgroundColor=[UIColor blackColor];
    self.navigationItem.titleView=view;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
