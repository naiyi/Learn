//
//  ViewController.m
//  UITableView
//
//  Created by yosemite on 16/9/12.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView=[self SetUpTableHeaderView];
    _tableView.tableFooterView=[self SetUpTableFooterView];
    
}
-(UIView *)SetUpTableHeaderView
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    imageview.image=[UIImage imageNamed:@"1"];
    [view addSubview:imageview];
    return view;
}
-(UIView *)SetUpTableFooterView
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, view.frame.size.width-20, view.frame.size.height-10)];
    label.text=@"提交订单";
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if (section==1){
        return 7;
    }else
        return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
    }
    if (indexPath.section==0) {
       
    }
    if (indexPath.section==1) {
        cell.textLabel.text=@"1221";
        cell.detailTextLabel.text=@"qww";
    }
    if (indexPath.section==2) {
       
      
    }
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
