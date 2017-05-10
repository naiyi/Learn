//
//  MainTabBarController.m
//  UITabBarController标签栏控制器
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "MainTabBarController.h"
#import "WXViewController.h"
#import "ContactViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController
+(void)initialize
{
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    [[UIBarButtonItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"微信" image:[[UIImage imageNamed:@"tabbar_mainframe@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]selectedImage:[[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"通讯录" image:[[UIImage imageNamed:@"tabbar_contacts@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_contactsHL@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"发现" image:[[UIImage imageNamed:@"tabbar_discover@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    UITabBarItem *item4=[[UITabBarItem alloc]initWithTitle:@"我" image:[[UIImage imageNamed:@"tabbar_me@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabbar_meHL@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    self.tabBar.items=@[item1,item2,item3,item4];
    WXViewController *wxVC=[[WXViewController alloc]init];
    wxVC.tabBarItem=item1;
    UINavigationController *wxNav=[[UINavigationController alloc]initWithRootViewController:wxVC];
    wxNav.navigationBar.barTintColor=[UIColor whiteColor];// 导航栏的背景颜色
    wxNav.navigationBar.tintColor=[UIColor whiteColor];
    ContactViewController *contactVC=[[ContactViewController alloc]init];
    contactVC.tabBarItem=item2;
    UINavigationController *contactNav=[[UINavigationController alloc]initWithRootViewController:contactVC];
    
    DiscoverViewController *discoverVC=[[DiscoverViewController alloc]init];
    discoverVC.tabBarItem=item3;
    UINavigationController *discoverNav=[[UINavigationController alloc]initWithRootViewController:discoverVC];
    
    MeViewController *meVC=[[MeViewController alloc]init];
    meVC.tabBarItem=item4;
    UINavigationController *meNav=[[UINavigationController alloc]initWithRootViewController:meVC];
    meNav.navigationBar.tintColor=[UIColor grayColor];
    self.tabBar.barTintColor=[UIColor whiteColor];
    self.viewControllers=@[wxNav,contactNav,discoverNav,meNav];
    
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
