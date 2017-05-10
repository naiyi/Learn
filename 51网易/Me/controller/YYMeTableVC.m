//
//  YYMeTableVC.m
//  51网易
//
//  Created by YY on 16/5/11.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYMeTableVC.h"
#import "PrefixHeader.pch"
@interface YYMeTableVC ()

@end

@implementation YYMeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationItem.title=@"关于焦点新闻";
    self.view.backgroundColor=[UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 20,MainScreenW-20 , 500)];
    label.text=@"        <<焦点新闻>>是由 YY 个人独立完成的新闻服务平台,焦点新闻致力于为用户提供最新,最真实的社会动态,让您即使不出门,也能知尽天下事.\n        如果你每天忙着上班不顾及看新闻联播,而又想了解最新的时事,那么拿出你的苹果手机,打开 AppStore,搜索焦点新闻,点击下载,安装.每当在地铁上的闲暇时间,看看新闻打发时间.\n        时时新闻非常注重用户体验,如果您在使用过程中有什么问题欢迎联系我们的客服,我们会尽快完善我们的app,给您带来不一样的体验.";
    label.font=[UIFont systemFontOfSize:20];
    label.numberOfLines=0;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
