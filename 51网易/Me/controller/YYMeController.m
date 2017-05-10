//
//  YYMeController.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYMeController.h"
#import "UIBarButtonItem+YYBarButtonItem.h"
//#import "YYSettingController.h"
#import "PrefixHeader.pch"
#import "YYHeadView.h"
#import "YYMeTableVC.h"
#import "YYTableOneVC.h"
#import "YYTableTwoVC.h"
#import "YYTableThreeVC.h"
@interface YYMeController ()
{
    
NSMutableArray *_mineArr;
}
@end

@implementation YYMeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navigationItem.title=@"我的";
//    UIBarButtonItem *item=[UIBarButtonItem barButtonItemWithTitle:@"设置" target:self action:@selector(settingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem=item;
    
    
    YYHeadView *headview=[[YYHeadView alloc]initWithFrame:CGRectMake(0,0,MainScreenW , 200)];
    headview.backgroundColor=[UIColor redColor];
    self.tableView.tableHeaderView=headview;
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    _mineArr=[NSMutableArray arrayWithObjects:@"关于软件",@"隐私条款",@"联系我们",@"服务条款和协议", nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_mineArr count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.textLabel.text=_mineArr[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 60;
}
#pragma mark    --- 设置按钮的点击事件
-(void)settingBtnClicked:(UIBarButtonItem *)item
{
//    YYSettingController *settingVC=[[YYSettingController alloc]init];
//    [self.navigationController pushViewController:settingVC animated:YES];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        YYMeTableVC *meVC=[[YYMeTableVC alloc]init];
        [self.navigationController pushViewController:meVC animated:YES];
    }
    else if (indexPath.row==1){
        YYTableOneVC *oneVC=[[YYTableOneVC alloc]init];
        [self.navigationController pushViewController:oneVC animated:YES];
    }else if (indexPath.row==2){
        YYTableTwoVC *twoVC=[[YYTableTwoVC alloc]init];
        [self.navigationController pushViewController:twoVC animated:YES];
    }
    else
    {
        YYTableThreeVC *threeVC=[[YYTableThreeVC alloc]init];
        [self.navigationController pushViewController:threeVC animated:YES];
    }
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
