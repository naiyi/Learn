//
//  PopView.m
//  弹框
//
//  Created by YY on 2017/3/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "PopView.h"
#define MainScrrenW [UIScreen mainScreen].bounds.size.width
#define MainScrrenH [UIScreen mainScreen].bounds.size.width
#define contentViewWidthRatio 0.76
#define contentViewWidhtHeightRatio 0.74
@interface PopView ()
@property (nonatomic,strong)UIImageView *showImgView;
@property (nonatomic,strong)UIImageView *closeImgView;

@end

@implementation PopView

-(instancetype)initWithWithImage:(UIImage *)image clickCallBack:(ClickCallBack)clickCallBack andCloseCallBack:(CloseCallBack)closeCallBack{
    if (self==[super init]) {
        
        self.closeCallBack=closeCallBack;
        self.clickCallBack=clickCallBack;
        [self createShowImgView];
        [self  createCloseImgView];
    }
    
    return  self;
}
-(void)createShowImgView{
    CGFloat showImgViewWid=MainScrrenW*contentViewWidthRatio;
    CGFloat showImgViewHig=showImgViewWid/contentViewWidhtHeightRatio;
    self.showImgView=[[UIImageView alloc] initWithFrame:CGRectMake((MainScrrenW-showImgViewWid)/2,(MainScrrenH-showImgViewHig)/2 , showImgViewWid, showImgViewWid/contentViewWidhtHeightRatio)];
    [self.view addSubview:self.showImgView];
}


-(void)createCloseImgView{
    self.closeImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, self.showImgView.frame.origin.y+_showImgView.frame.size.height+50, 30, 30)];
    self.closeImgView.center=self.view.center;
    self.closeImgView.image=[UIImage imageNamed:@"close"];
    [self.view addSubview:self.closeImgView];
    
}
-(void)show{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:5 forView:[[UIApplication sharedApplication] keyWindow] cache:YES];
        [[[UIApplication sharedApplication] keyWindow] addSubview:[self view]];
    } completion:^(BOOL finished) {
        //        2秒后消失
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        //            [self.view removeFromSuperview];
        //        });
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
