//
//  YYNewsHeadView.m
//  51网易
//
//  Created by YY on 16/5/5.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYNewsHeadView.h"
#import "YYT1348647909107.h"
#import "UIImageView+WebCache.h"
#import "WebViewController.h"
#import "PrefixHeader.pch"
@interface YYNewsHeadView ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@end
@implementation YYNewsHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}


-(void)setUpScrollView
{
    _scrollView=[[UIScrollView alloc]initWithFrame:self.bounds];
    
    _scrollView.pagingEnabled=YES;
    _scrollView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_scrollView];

    for (NSInteger i=0; i<_arr.count; i++) {
       
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[_arr[i] imgsrc]]];
        [_scrollView addSubview:imageView];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 140,300 , 50)];
        label.textColor=[UIColor redColor];
        label.text=[_arr[i] title];
        [imageView addSubview:label];
    }
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollDid) userInfo:nil repeats:YES];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*_arr.count, 0);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, self.frame.size.height-30, self.frame.size.width-200, 30)];
    _pageControl.numberOfPages = _arr.count;
    _pageControl.currentPage = 0;
    
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self addSubview:_pageControl];
}

//- (UIViewController *)viewController
//{
//    for (UIView *next = [self superview]; next; next =next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[U你IViewController class]]) {
//            return (UIViewController *)nextResponder;
//        }
//    }
//    return nil;
//}

//-(void)tapClicked:(UITapGestureRecognizer *)tap
//{
//    YYT1348647909107 *model=self.arr[0];
//    WebViewController *webViewVC=[[WebViewController alloc]init];
//    webViewVC.url=model.url;
//    
//     [[self viewController].navigationController pushViewController:webViewVC animated:YES];
//}
-(void)scrollDid{

    static NSInteger j;
    if (j==_arr.count)
        j=0;
    _scrollView.contentOffset=CGPointMake(MainScreenW*j, 0);
    _pageControl.currentPage=j;
       j++;
    
}
-(void)setArr:(NSArray *)arr{
    _arr=arr;
    [self setUpScrollView];
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
   
}
@end
