//
//  ViewController.m
//  滑动菜单案例01
//
//  Created by YY on 16/5/13.
//  Copyright © 2016年 YY. All rights reserved.
//
#define MainScreenW ([UIScreen mainScreen].bounds.size.width)
#define MainScreenH ([UIScreen mainScreen].bounds.size.height)
#import "ViewController.h"
#import "YYMenuView.h"
#import "YYTableView.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *_titleArr;
    UIScrollView *_scrollView;
    YYMenuView *_menuView;
}
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _titleArr=[NSMutableArray arrayWithObjects:@"头条",@"社会",@"手机",@"郑州",@"热点",@"体育",@"搞笑",@"科技",@"娱乐", nil];
     [self setUpScrollView];
    _menuView=[[YYMenuView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 60) titles:_titleArr clickBlock:^(NSInteger index) {
       _scrollView.contentOffset = CGPointMake((index-1) * MainScreenW, 0);
       
    }];
    [self.view addSubview:_menuView];
}
-(void)setUpScrollView
{
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 80, MainScreenW, MainScreenH-80)];
    _scrollView.delegate=self;
    _scrollView.pagingEnabled=YES;
    _scrollView.contentSize=CGSizeMake(MainScreenW*_titleArr.count, 0);
    [self.view addSubview:_scrollView];
    for (int i=0; i<_titleArr.count; i++) {
        YYTableView *tableView=[[YYTableView alloc]initWithFrame:CGRectMake(MainScreenW*i, 0, MainScreenW, MainScreenH)];
        if (i==0) {
           
            tableView.backgroundColor=[UIColor redColor];
        }
        if (i==1) {
           
            tableView.backgroundColor=[UIColor yellowColor];
        }
        if (i==2) {
        tableView.backgroundColor=[UIColor cyanColor];
        }
        if (i==3) {
           
            tableView.backgroundColor=[UIColor whiteColor];
        }
        if (i==4) {
            
            tableView.backgroundColor=[UIColor blueColor];
        }
        if (i==5) {
            
            tableView.backgroundColor=[UIColor greenColor];
        }
        [_scrollView addSubview:tableView];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
     _menuView.currentIndex =scrollView.contentOffset.x /MainScreenW;
    UIButton *btn=[self.view viewWithTag:_menuView.currentIndex+1];
    btn.titleLabel.font=[UIFont systemFontOfSize:22];
}

#pragma mark 结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        _menuView.defaultIndex = scrollView.contentOffset.x /MainScreenW;
        UIButton *btn=[self.view viewWithTag:_menuView.currentIndex+1];
        btn.titleLabel.font=[UIFont systemFontOfSize:22];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
