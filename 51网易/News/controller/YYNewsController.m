//
//  YYNewsController.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//
#define SCR_W     self.view.frame.size.width
#define SCR_H     self.view.frame.size.height
#define LAST_LABEL_FOUT 16
#define NOW_LABEL_FOUT 22
#define TAG_ONEHUNDRED 70
#define TABBAR

typedef enum {
    
    AXC_ZERO  =0,
    AXC_ADD,
    AXC_ATWO,
    AXC_ATHR,
    AXC_FOUR,
    TENOFADD  =10
    
}AXC_ENUM;

#define SIX_TEN  (TENOFADD + TENOFADD ) * AXC_ATHR
#define EIGHT_TEN  (TENOFADD + TENOFADD ) * AXC_FOUR




#import "YYNewsController.h"
#import "UIBarButtonItem+YYBarButtonItem.h"


@interface YYNewsController ()<UIScrollViewDelegate>
{
    UIScrollView *_titleScrollView;
    
    UIScrollView *_contentScrollView;
    
    NSInteger _lastSelectedTag;
    
    NSInteger _pageNum;
}
@end

@implementation YYNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self addPortData];
//    [self setUpNavigationItem];
   
    [self addTitleScrollView];
    
    [self addContentScreollView];

    
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
//    UISearchBar *searchBar=[[UISearchBar alloc]init];
//    searchBar.placeholder=@"大家正在搜";
//    
//    self.navigationItem.titleView=searchBar;
self.navigationItem.title=@"首页";
}
-(void)setUpNavigationItem
{
    
    UIBarButtonItem *item=[UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"search_icon-1"] highlightedImage:[UIImage imageNamed:@"search_icon"] target:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=item;
    
  
    
    
}


-(void)itemClicked:(UIBarButtonItem *)item
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addPortData{
    
    _ShowPagesClassNameArray = [NSArray arrayWithObjects:@"YYOneViewController",@"YYTwoViewController",@"YYThreeViewController",@"YYFourViewController",@"YYFiveViewController",@"YYSixViewController",@"YYSevenViewController", nil];
    
    _arrayTittles = [NSArray arrayWithObjects:@"推荐",@"头条",@"健康",@"漫画",@"军事",@"历史",@"游戏", nil];
    
    _pageNum = _ShowPagesClassNameArray.count;
}

- (void)addTitleScrollView{
    
    _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(AXC_ZERO, SIX_TEN + AXC_FOUR, SCR_W, 35)];
    _titleScrollView.backgroundColor = [UIColor whiteColor];
    _titleScrollView.showsHorizontalScrollIndicator = NO;
    _titleScrollView.showsVerticalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //设置滚动视图的滑动范围
    //设置标题的宽度
    CGFloat labelW = EIGHT_TEN;
    _titleScrollView.contentSize = CGSizeMake(labelW * _arrayTittles.count, AXC_ZERO);
    
    //添加label
    for (int i = AXC_ZERO ; i < _arrayTittles.count; i++) {
        CGFloat labelY = AXC_ZERO;
        CGFloat labelH = SIX_TEN - TENOFADD;
        CGFloat labelX = i * labelW;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:LAST_LABEL_FOUT];
        label.text = _arrayTittles[i];
        
        //给label添加手势
        label.userInteractionEnabled = YES;
        label.tag = TAG_ONEHUNDRED + i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapLabel:)];
        [label addGestureRecognizer:tap];
        
        //设置默认选项
        if (i == AXC_ZERO) {
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:NOW_LABEL_FOUT];
            _lastSelectedTag = label.tag;
        }
        [_titleScrollView addSubview:label];
    }
    
    [self.view addSubview:_titleScrollView];
}

#pragma mark - 点击标题
- (void)TapLabel:(UITapGestureRecognizer *)sender{
    
    NSInteger index = sender.view.tag - TAG_ONEHUNDRED;
    CGFloat offSetX = SCR_W * index;
    
    [_contentScrollView setContentOffset:CGPointMake(offSetX, AXC_ZERO) animated:NO];
    
    NSInteger tagOfLabel = index + TAG_ONEHUNDRED;
    if (tagOfLabel == _lastSelectedTag) {
        return;
    }
    //获取当前点击的Label
    UILabel *nowLabel = (UILabel *)[self.view viewWithTag:tagOfLabel];
    
    //更改状态
    nowLabel.textColor = [UIColor redColor];
    nowLabel.font = [UIFont systemFontOfSize:NOW_LABEL_FOUT];
    
    //获取上一个点击按钮
    UILabel *lastLabel = (UILabel *)[self.view viewWithTag:_lastSelectedTag];
    lastLabel.textColor = [UIColor blackColor];
    lastLabel.font = [UIFont systemFontOfSize: LAST_LABEL_FOUT];
    _lastSelectedTag = tagOfLabel;
    
    //点击后自动居中
    if (index >= AXC_ATWO && index <_pageNum - AXC_ATWO) {
        
        NSInteger OrX = nowLabel.tag - TAG_ONEHUNDRED;
        [_titleScrollView setContentOffset:CGPointMake(OrX * lastLabel.frame.size.width - (SCR_W/AXC_ATWO-lastLabel.frame.size.width/AXC_ATWO), AXC_ZERO) animated:YES];
    }
}

- (void)addContentScreollView{
    
    CGFloat contentCcrollViewY = CGRectGetMaxY(_titleScrollView.frame);
    CGFloat contentCcrollViewW = SCR_W;
    CGFloat contentCcrollViewH = SCR_H - contentCcrollViewY;
    CGFloat contentCcrollViewX = AXC_ZERO;
    
    _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(contentCcrollViewX, contentCcrollViewY, contentCcrollViewW, contentCcrollViewH)];
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.contentSize = CGSizeMake(SCR_W * _arrayTittles.count, AXC_ZERO);
    _contentScrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets=NO;
    _contentScrollView.delegate = self;
    
    //添加视图
    for (int i = AXC_ZERO ; i < _ShowPagesClassNameArray.count; i++) {
        Class class = NSClassFromString(_ShowPagesClassNameArray[i]);
               
        UIViewController *View = [[class alloc]init];
        UIView *view = View.view;
        CGFloat viewx = SCR_W * i;
        CGRect frame = view.frame;
        frame.origin.x = viewx;
        view.frame = frame;
        [_contentScrollView addSubview:view];
        
        [self addChildViewController:View];
    }
    [self.view addSubview:_contentScrollView];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //获取用户滑动到第几页
    NSInteger index = scrollView.contentOffset.x / SCR_W;
    
    //判断用户有没有滑动
    NSInteger labelOfTag = index + TAG_ONEHUNDRED;
    //用户没有切换界面
    if (labelOfTag == _lastSelectedTag) {
        return;
    }
    
    //获取当前要选中的label
    UILabel *nowLabel = (UILabel *)[self.view viewWithTag:labelOfTag];
    
    nowLabel.textColor = [UIColor redColor];
    nowLabel.font = [UIFont systemFontOfSize:NOW_LABEL_FOUT];
    
    //把上一个选中的Label回复原来状态
    UILabel *LastLabel = (UILabel *)[self.view viewWithTag:_lastSelectedTag] ;
    LastLabel.textColor = [UIColor blackColor];
    LastLabel.font = [UIFont systemFontOfSize:LAST_LABEL_FOUT];
    
    _lastSelectedTag = labelOfTag;
    
    //让Title跟随内容滑动 前三个不滑
    if (index >= AXC_ATWO && index <_pageNum - AXC_ATWO) {
        CGFloat offSetX = (index - AXC_ATWO) *LastLabel.frame.size.width;
        
        [_titleScrollView setContentOffset:CGPointMake(offSetX + TENOFADD, AXC_ZERO) animated:YES];
    }
    
}



@end
