//
//  ViewController.m
//  视图镂空
//
//  Created by 张帅 on 2017/4/13.
//  Copyright © 2017年 张帅. All rights reserved.
//

#import "ViewController.h"
#define SCREEN  [UIScreen mainScreen].bounds.size
#define Color_RGB(r,g,b,a) ([UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:(a)])
@interface ViewController (){
    UIView * hollowView;
    BOOL isTop;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isTop=YES;
    
    UIImageView * backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image=[UIImage imageNamed:@"xiaohuangren.jpg"];
    backgroundImageView.userInteractionEnabled=YES;
    [self.view addSubview:backgroundImageView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [backgroundImageView addGestureRecognizer:tap];
    
    hollowView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN.width/2-100, -200, 200, 200)];
    hollowView.backgroundColor=Color_RGB(0, 186, 111, 1);
    hollowView.layer.cornerRadius=10;
    hollowView.layer.masksToBounds=YES;
    [self.view addSubview:hollowView];
    [self setHollowView];
    
}
- (void)setHollowView {
    //创建BezierPath 绘制_bgVC层
    UIBezierPath * bPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0,hollowView.frame.size.width, hollowView.frame.size.height)];
    //再创建一个 BezierPath 指定镂空的位置大小
    UIBezierPath * aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(hollowView.frame.size.width/2-50, hollowView.frame.size.height/2-50, 100, 100) cornerRadius:50];
    //创建 CaShapeLayer
    CAShapeLayer * layer = [[CAShapeLayer alloc] init];
    //这句话很重要 （appendPath 追加路径） （[aPath bezierPathByReversingPath] 倒回路径）
    [bPath appendPath:[aPath bezierPathByReversingPath]];
    layer.path = bPath.CGPath;
    //最后添加——bgCv （setMask 面具）
    [hollowView.layer setMask:layer];
}

- (void)tapClick {
    if (isTop) {
        //弹性动画
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            hollowView.frame=CGRectMake(SCREEN.width/2-100, 200, 200, 200);
        } completion:nil];
    } else {
        //弹性动画
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            hollowView.frame=CGRectMake(SCREEN.width/2-100, -200, 200, 200);
        } completion:nil];
    }
    isTop=!isTop;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
