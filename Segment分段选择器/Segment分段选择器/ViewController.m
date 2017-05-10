//
//  ViewController.m
//  Segment分段选择器
//
//  Created by YY on 16/5/20.
//  Copyright © 2016年 YY. All rights reserved.
//
#define MainScreenW [UIScreen mainScreen].bounds.size.width
#define MainScreenH [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *headerSegment;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollview;

@property (nonatomic,strong)FirstViewController *first;
@property (nonatomic,strong)SecondViewController *second;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpScrollView];
    [self setUpChildViewControll];
    [_headerSegment addTarget:self action:@selector(segmentSelect:) forControlEvents:UIControlEventValueChanged];
}
-(void)segmentSelect:(UISegmentedControl*)seg{
    NSInteger index = seg.selectedSegmentIndex;
    CGRect frame = _contentScrollview.frame;
    frame.origin.x = index * CGRectGetWidth(_contentScrollview.frame);
    frame.origin.y = 0;
    [_contentScrollview scrollRectToVisible:frame animated:YES];
}
-(void)setUpScrollView{
    _contentScrollview.pagingEnabled = YES;
    _contentScrollview.delegate = self;
    _contentScrollview.showsHorizontalScrollIndicator = NO;
    //方向锁
    _contentScrollview.directionalLockEnabled = YES;
    //取消自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    _contentScrollview.contentSize = CGSizeMake(MainScreenW * 2, MainScreenH - 64);
}
/**
 *  设置控制的每一个子控制器
 */
-(void)setUpChildViewControll{
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.first = [storyBoard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    self.second = [storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    //指定该控制器为其子控制器
    [self addChildViewController:_first];
    [self addChildViewController:_second];
    //将视图view加入到scrollview上
    [_contentScrollview addSubview:_first.view];
    [_contentScrollview addSubview:_second.view];
    //设置两个控制器的  位置
    CGRect secondRect = _second.view.frame;
    secondRect.origin.x = MainScreenW;
    secondRect.size.height = CGRectGetHeight(_contentScrollview.frame);
    _second.view.frame = secondRect;
}

#pragma mark - Scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / MainScreenW);
    _headerSegment.selectedSegmentIndex = ratio;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
