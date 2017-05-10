//
//  YYTabBarController.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYTabBarController.h"
#import "YYMeController.h"
#import "YYMediaController.h"
#import "YYNewsController.h"
#import "YYReaderController.h"
@interface YYTabBarController ()

@end

@implementation YYTabBarController
+(void)initialize
{
[[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpChildControllers];
    [self setUpTabbarItem];
}




-(void)setUpChildControllers
{
    NSArray *className=@[@"YYNewsController",@"YYReaderController",@"YYMediaController",@"YYMeController"];
    for (int i=0; i<4 ;i++) {
        UIViewController *vc=[[NSClassFromString(className[i]) alloc]initWithStyle:UITableViewStyleGrouped];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}
-(void)setUpTabbarItem
{
    NSArray *titleArr=@[@"新闻",@"论坛",@"视频",@"我"];
    NSArray *selectImageArr=@[[[UIImage imageNamed:@"tabbar_icon_news_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_reader_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_media_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_me_highlight"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    NSArray *imageArr=@[[[UIImage imageNamed:@"tabbar_icon_news_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_reader_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_media_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],[[UIImage imageNamed:@"tabbar_icon_me_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    for (int i=0; i<4; i++) {
        UIViewController *vc=self.viewControllers[i];
        vc.tabBarItem=[[UITabBarItem alloc]initWithTitle:titleArr[i] image:imageArr[i] selectedImage:selectImageArr[i]];
        
    }
    
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
