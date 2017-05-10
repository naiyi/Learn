//
//  YYBannerAlertView.m
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYBannerAlertView.h"
#import <UIKit/UIKit.h>
#define contentViewWidthRatio 0.76
#define contentViewWidhtHeightRatio 0.74
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define viewHeight [UIScreen mainScreen].bounds.size.height
#define viewWidth [UIScreen mainScreen].bounds.size.width
static YYBannerAlertView *alertView = nil;

@interface YYBannerAlertView ()<UIScrollViewDelegate>

@property YYBannerAlertView *currentObject;
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong)UIView *contentView;

@property (nonatomic,strong)UIScrollView *scrollView;

@property (nonatomic,strong)UIPageControl *pageControl;

@property(nonatomic,strong)UIWindow *alterViewWindow;

@end
@implementation YYBannerAlertView

-(instancetype)initWithView{
    if (self=[super init]) {
        self.currentObject = self;
        [self showAlertView];
        [self setUpSubviews];
        
    }
    return self;
}

-(void)setUpSubviews{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    self.bgView.backgroundColor=[UIColor colorWithWhite:0.2 alpha:0.4];
    CGFloat originX=(viewWidth-viewWidth*contentViewWidthRatio)/2;
    CGFloat originY=(viewHeight-viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio)/2-40;
    self.contentView=[[UIView alloc] initWithFrame:CGRectMake(originX, originY, viewWidth*contentViewWidthRatio, viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio)];
    self.contentView.backgroundColor=[UIColor whiteColor];
    self.contentView.layer.cornerRadius=5;
    [self.bgView addSubview:self.contentView];
    [self.view addSubview:self.bgView];
    self.btn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame=CGRectMake((viewWidth-60)/2, self.contentView.frame.origin.y+self.contentView.frame.size.height+20, 60, 60);
    
    self.btn.layer.cornerRadius=30;
    [self.btn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    [self.bgView addSubview:self.btn];
    
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height*0.75)];
    [self.contentView addSubview:self.scrollView];
    self.scrollView.pagingEnabled=YES;
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(10, self.contentView.frame.size.height*0.75+2, self.contentView.frame.size.width-20, 1)];
    line.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:line];
    NSArray *imageArr=@[[UIImage imageNamed:@"111"],[UIImage imageNamed:@"112"],[UIImage imageNamed:@"113"]];
    NSArray *imgArr=@[[UIImage imageNamed:@"组-9"],[UIImage imageNamed:@"组-10"],[UIImage imageNamed:@"组-11"]];
    NSArray *titleArr=@[@"Participating hotels",@"My profile",@"QR code"];
    for (NSInteger i=0; i<3; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        imageView.image=imageArr[i];
        [self.scrollView addSubview:imageView];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat H=self.contentView.frame.size.height*0.25;
        CGFloat btnW=H/2;
        CGFloat Margin=(self.contentView.frame.size.width-3*btnW)/4;
        btn.frame=CGRectMake(Margin+(Margin+btnW)*i, line.frame.origin.y+5, btnW, btnW);
        btn.layer.cornerRadius=btnW/2;
        [btn setImage:imgArr[i] forState:UIControlStateNormal];
        btn.tag=100+i;
        [btn addTarget:self action:@selector(btn1Clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(Margin+(Margin+btnW)*i, btn.frame.origin.y+btnW-12, btnW, btnW)];
        label.text=titleArr[i];
        label.textColor=[UIColor colorWithRed:0.85 green:0.64 blue:0.18 alpha:1];
        label.numberOfLines=0;
        label.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:label];
    }
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*3, 0);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, self.contentView.frame.origin.y+self.contentView.frame.size.height+2, self.bgView.frame.size.width-200, 20)];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self.bgView addSubview:_pageControl];

}
-(void)showAlertView{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:5 forView:[[UIApplication sharedApplication] keyWindow] cache:YES];
        [[[UIApplication sharedApplication] keyWindow] addSubview:[self view]];
    } completion:^(BOOL finished) {
       
    }];
}
-(void)btn1Clicked:(UIButton *)btn{

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

-(void)btnClicked:(UIButton *)btn{
    [[self view] removeFromSuperview];
    self.currentObject=nil;
    
}
@end
