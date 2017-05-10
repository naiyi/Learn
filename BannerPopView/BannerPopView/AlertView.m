//
//  AlertView.m
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "AlertView.h"
#import <UIKit/UIKit.h>
#define contentViewWidthRatio 0.76
#define contentViewWidhtHeightRatio 0.74
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define viewHeight [UIScreen mainScreen].bounds.size.height
#define viewWidth [UIScreen mainScreen].bounds.size.width
static AlertView *alertView = nil;
@interface AlertView()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataList;
}
@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)UIButton *btn;

@end

@implementation AlertView
+(instancetype)sigle
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertView = [[AlertView alloc]init];
        
    });
    return alertView;
}

-(void)titleArray:(NSArray *)titleArr{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    self.bgView.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.4];
    CGFloat originX=(viewWidth-viewWidth*contentViewWidthRatio)/2;
    CGFloat originY=(viewHeight-viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio)/2;
   
    self.tableview=[[UITableView alloc] initWithFrame:CGRectMake(originX, originY, viewWidth*contentViewWidthRatio, viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio) style:UITableViewStyleGrouped];
    self.tableview.backgroundColor=[UIColor whiteColor];
    [self.bgView addSubview:self.tableview];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.btn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame=CGRectMake((viewWidth-60)/2, self.tableview.frame.origin.y+self.tableview.frame.size.height+20, 60, 60);
   
    self.btn.layer.cornerRadius=30;
    [self.btn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    [self.bgView addSubview:self.btn];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.tableview registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"head"];
    _dataList=titleArr;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self.bgView];
    
    [window bringSubviewToFront:self.bgView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text=_dataList[indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 60)];
    view.backgroundColor=[UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.tableview.frame.size.width/2, 50)];
    label.text=@"SECURE networks are found";
    label.numberOfLines=0;
    label.textColor=[UIColor whiteColor];
    [view addSubview:label];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(label.frame.size.width+30, 10, 100, 40);
    [btn setTitle:@"Connect Me" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor colorWithRed:0.75 green:0 blue:0.15 alpha:1];
    [view addSubview:btn];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * urlString = @"App-Prefs:root=WIFI";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        if (iOS10) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
-(void)btnClicked:(UIButton *)btn{
    [self.bgView removeFromSuperview];
    [self.btn removeFromSuperview];
    [self.tableview removeFromSuperview];
    self.tableview=nil;
    self.bgView=nil;
    self.btn=nil;
    
}
-(void)show{
    
}
@end