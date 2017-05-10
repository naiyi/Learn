//
//  WXViewController.m
//  UITabBarController标签栏控制器
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "WXViewController.h"
#import "DetailViewController.h"
@interface WXViewController ()

@end

@implementation WXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    self.title=@"微信";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(btnClickAdd)];
    
}
-(void)btnClickAdd
{
    DetailViewController *detailVC=[[DetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@">>>>>----------------<<<<<<<<");
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
