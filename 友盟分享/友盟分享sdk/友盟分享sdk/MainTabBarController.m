//
//  MainTabBarController.m
//  友盟分享sdk
//
//  Created by yosemite on 16/9/28.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "MainTabBarController.h"
#import "ShareTableViewController.h"
#import "AuthTableViewController.h"
#import "UserInfoTableViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ShareTableViewController *shareVC=[[ShareTableViewController alloc]init];
    shareVC.title=@"分享";
    shareVC.tabBarItem.image=[UIImage imageNamed:@"UMS_share@2x"];
    UINavigationController *shareNav=[[UINavigationController alloc]initWithRootViewController:shareVC];
    
    AuthTableViewController *authVC=[[AuthTableViewController alloc]init];
    authVC.title=@"授权";
    authVC.tabBarItem.image=[UIImage imageNamed:@"UMS_account@2x"];
    UINavigationController *authNav=[[UINavigationController alloc]initWithRootViewController:authVC];
    
    UserInfoTableViewController *userInfoVC=[[UserInfoTableViewController alloc]init];
    userInfoVC.title=@"用户资料";
    userInfoVC.tabBarItem.image=[UIImage imageNamed:@"UMS_bar@2x"];
    UINavigationController *userInfoNav=[[UINavigationController alloc]initWithRootViewController:userInfoVC];
    self.viewControllers=[NSArray arrayWithObjects:shareNav,authNav,userInfoNav, nil];
    
    
    
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
