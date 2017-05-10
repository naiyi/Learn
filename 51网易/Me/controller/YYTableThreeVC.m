//
//  YYTableThreeVC.m
//  51网易
//
//  Created by YY on 16/5/12.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYTableThreeVC.h"

@interface YYTableThreeVC ()

@end

@implementation YYTableThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.title=@"服务条款和协议";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 20,self.view.bounds.size.width-20 , 400)];
    label.text=@"       焦点新闻服务所含的如文字,图标, logo, 图像,视频片段都是时事新闻的或者其提供者的财产,受中国和国际版物权法的保护,时时新闻也尊重他人的知识产权,如果您认为时时新闻侵犯到你的版权,您可以通过我们的客服联系我们,我们会按法律程序予以处理.";
    label.font=[UIFont systemFontOfSize:20];
    label.numberOfLines=0;
    [self.view addSubview:label];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
