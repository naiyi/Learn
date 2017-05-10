//
//  PopView.m
//  弹框
//
//  Created by YY on 2017/3/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "PopView.h"
#define MainScrrenW [UIScreen mainScreen].bounds.size.width
#define MainScrrenH [UIScreen mainScreen].bounds.size.height
#define contentViewWidthRatio 0.70
#define contentViewWidhtHeightRatio 0.75
@interface PopView ()
@property (nonatomic,strong)PopView *currentPopView;
@property (nonatomic,strong)UIImageView *showImgView;
@property (nonatomic,strong)UIImageView *closeImgView;

@end

@implementation PopView

-(instancetype)initWithWithImage:(UIImage *)image clickCallBack:(ClickCallBack)clickCallBack andCloseCallBack:(CloseCallBack)closeCallBack{
    if (self=[super init]) {
        self.currentPopView=self;
        self.closeCallBack=closeCallBack;
        self.clickCallBack=clickCallBack;
        [self createShowImgView:image];
        [self  createCloseImgView];
        self.view.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.06];
        
    }
    
    return  self;
}
-(void)createShowImgView:(UIImage *)image{
    CGFloat showImgViewWid=MainScrrenW*contentViewWidthRatio;
    CGFloat showImgViewHig=showImgViewWid/contentViewWidhtHeightRatio;
    self.showImgView=[[UIImageView alloc] initWithFrame:CGRectMake((MainScrrenW-showImgViewWid)/2,(MainScrrenH-showImgViewHig)/2-20 , showImgViewWid, showImgViewWid/contentViewWidhtHeightRatio)];
    self.showImgView.image=image;
    self.showImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.showImgView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.showImgView];
    self.showImgView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked:)];
    [self.showImgView addGestureRecognizer:tap];
}
-(void)tapClicked:(UITapGestureRecognizer*)tap{
    if (self.clickCallBack) {
        self.clickCallBack();
    }
}
-(void)tapClose:(UITapGestureRecognizer*)tap{
    if (self.closeCallBack) {
        self.closeCallBack();
        [self.view removeFromSuperview];
        self.currentPopView=nil;
    }
    
}

-(void)createCloseImgView{
    self.closeImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.closeImgView.center=CGPointMake(MainScrrenW/2, self.showImgView.frame.origin.y+_showImgView.frame.size.height+30);
    self.closeImgView.backgroundColor=[UIColor lightGrayColor];
    self.closeImgView.layer.cornerRadius=20;
    self.closeImgView.image=[UIImage imageNamed:@"close"];
    [self.view addSubview:self.closeImgView];
    self.closeImgView.userInteractionEnabled=YES;
    self.closeImgView.contentMode = UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClose:)];
    [self.closeImgView addGestureRecognizer:tap];
    
}
-(void)show{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:5 forView:[[UIApplication sharedApplication] keyWindow] cache:YES];
        [[[UIApplication sharedApplication] keyWindow] addSubview:[self view]];
    } completion:^(BOOL finished) {
//        //        2秒后消失
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//                    [self.view removeFromSuperview];
//                });
    }];
}


@end
