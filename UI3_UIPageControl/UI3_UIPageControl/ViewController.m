//
//  ViewController.m
//  UI3_UIPageControl
//
//  Created by zhangxueming on 16/3/11.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgView.image = [UIImage imageNamed:@"guideView_bg"];
    [self.view addSubview:bgView];
    
    _scrollView = [[UIScrollView alloc]  initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    _scrollView.pagingEnabled = YES;
    
    for (NSInteger i=0; i<4; i++) {
        NSString *picName = [NSString stringWithFormat:@"guideView_%li@2x",i+1];
        UIImage *image = [UIImage imageNamed:picName];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        imageView.image = image;
        [_scrollView addSubview:imageView];
    }
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollDid) userInfo:nil repeats:YES];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*4, 0);
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, self.view.frame.size.height-80, self.view.frame.size.width-200, 30)];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:_pageControl];
}
-(void)scrollDid
{
    static NSInteger j = 0;
    if (j == 4) j = 0;
    _scrollView.contentOffset = CGPointMake(self.view.frame.size.width *j, 0);
    _pageControl.currentPage =_scrollView.contentOffset.x / self.view.frame.size.width;
    j++;
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
