//
//  ViewController.m
//  UI2_UIScrollView
//
//  Created by zhangxueming on 16/3/11.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_bgScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UIScrollView 滚动视图
    //创建滚动视图
    _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _bgScrollView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_bgScrollView];
    
    //添加内容视图
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    [_bgScrollView addSubview:imageView];
    
    //设置内容视图的大小
    _bgScrollView.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
    
    //设置边界回弹
    _bgScrollView.bounces = YES;
    
    //设置是否显示滚动条
    _bgScrollView.showsVerticalScrollIndicator = NO;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    
    //设置代理
    _bgScrollView.delegate = self;
    
    //内容偏移
    //_bgScrollView.contentOffset= CGPointMake(-100, -100);
    
    self.view.backgroundColor = [UIColor whiteColor];
    //取消滚动视图自适应contentInset(导航条的高度)
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //分页使能,一定有减速的过程
    _bgScrollView.pagingEnabled = YES;
    
    //滚动使能   默认打开
    _bgScrollView.scrollEnabled = YES;
    
    //设置放大缩小的系数
    _bgScrollView.minimumZoomScale = 0.2;
    _bgScrollView.maximumZoomScale = 5;
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"开始拉拽");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(decelerate)
    {
        NSLog(@"结束拖拽,伴随一个减速的动作");
    }
    else
    {
        NSLog(@"结束拖拽,没有减速动作");
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //拖拽滚动视图的时候,该方法不断的执行
    //NSLog(@"发生滚动");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"-----开始减速");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"-----减速结束");
}

//返回被缩放的视图对象
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews firstObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
