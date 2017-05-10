//
//  YYPopView.m
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYPopView.h"
#define contentViewWidthRatio 0.76
#define contentViewWidhtHeightRatio 0.74
typedef void (^Completion)();
#define viewHeight [UIScreen mainScreen].bounds.size.height
#define viewWidth [UIScreen mainScreen].bounds.size.width
@interface YYPopView ()
@property(nonatomic,strong)UIWindow *alterViewWindow;
@property(nonatomic,strong)UIWindow *previousWindow;

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIButton *closeButton;
@property(nonatomic,assign)CGFloat contentViewWidth;
@property(nonatomic,assign)CGFloat contentViewHeight;
@property(nonatomic,assign)CGFloat contentViewX;
@property(nonatomic,assign)CGFloat marginWidth;
@property(nonatomic,assign)CGFloat subViewSpaceWidth;
@property(nonatomic,assign)CGFloat closeButtonWidthHeight;
@property(nonatomic,assign)CGFloat closeButtonX;
@end

@implementation YYPopView

-(instancetype)initWithImages:(NSArray *)images clickedCallBack:(ClickedCallBack)clickedCallBack closedCallBack:(ClosedCallBack)closedCallBack
{
    if (self=[super init]) {
        [self yy_setupNewWindow];
        
        [self dl_setupFrameNumber];
        [self dl_setupContentView];
        
        [self dl_setupCloseButton];
        [self dl_setupSubViewsFrame];
        
        self.clickCallBack = clickedCallBack;
        self.closeCallBack = closedCallBack;
        self.view.backgroundColor=[UIColor clearColor];
    }
    
    return self;
}
-(void)yy_setupNewWindow
{
    UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.windowLevel = UIWindowLevelAlert;
    alertWindow.backgroundColor = [UIColor clearColor];
    alertWindow.rootViewController = self;
    self.alterViewWindow = alertWindow;
}

-(void)dl_setupFrameNumber
{
    self.contentViewWidth  = (viewWidth * contentViewWidthRatio);
    self.contentViewHeight =  (self.contentViewWidth / contentViewWidhtHeightRatio);
    self.contentViewX =  (viewWidth - self.contentViewWidth)/2;
    self.closeButtonWidthHeight = 40;
    self.closeButtonX = (viewWidth - self.closeButtonWidthHeight) / 2;
    self.marginWidth = 20;
    self.subViewSpaceWidth = (viewHeight - self.marginWidth - self.contentViewHeight - self.closeButtonWidthHeight) / 2;
}
-(void)dl_setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor cyanColor];
//    UITapGestureRecognizer *tapGresture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapAction)];
    contentView.userInteractionEnabled = YES;
    contentView.clipsToBounds = YES;
    contentView.layer.cornerRadius = 5;
//    [contentView addGestureRecognizer:tapGresture];
    self.contentView = contentView;
    [self.view addSubview:self.contentView];
}
-(void)dl_setupScrollViewWithImages:(NSArray *)images
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.contentView.frame];
    
}

-(void)dl_setupCloseButton
{
    UIButton *closeButton = [[UIButton alloc] init];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton = closeButton;
    [self.view addSubview:self.closeButton];
    
}
-(void)dl_setupSubViewsFrame
{
//    CGFloat contentViewY = self.contentViewHeight;
    
    CGFloat closeButtonY = viewHeight;
    self.closeButton.frame = CGRectMake(self.closeButtonX, closeButtonY, self.closeButtonWidthHeight, self.closeButtonWidthHeight);
    
    
}

-(void)dl_setupViewColor:(UIColor *)color completion:(Completion)completion{
    [UIView animateWithDuration:0.5 animations:^{
        self.view.backgroundColor = color;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}
-(void)dl_subViewsShowAnimation
{
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = CGRectMake(self.contentViewX, self.subViewSpaceWidth, self.contentViewWidth, self.contentViewHeight);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.closeButton.frame = CGRectMake(self.closeButtonX, viewHeight - self.subViewSpaceWidth - self.closeButtonWidthHeight, self.closeButtonWidthHeight, self.closeButtonWidthHeight);
    } completion:^(BOOL finished) {
        
    }];
}
-(void)dl_subViewsCloseAnimationWithcompletion:(Completion)completion
{
    
    CGFloat contentViewY = self.contentViewHeight;
    
    CGFloat closeButtonY = viewHeight;
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:8.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = CGRectMake(self.contentViewX, -contentViewY, self.contentViewWidth, self.contentViewHeight);
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
    
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.closeButton.frame = CGRectMake(self.closeButtonX, closeButtonY, self.closeButtonWidthHeight, self.closeButtonWidthHeight);
    } completion:^(BOOL finished) {
        
    }];
}
-(void)closeButtonAction
{
    __weak typeof(self) weakSelf = self;
    [self dl_setupViewColor:[UIColor clearColor] completion:nil];
    
    [self dl_subViewsCloseAnimationWithcompletion:^{
        [weakSelf.alterViewWindow setHidden:YES];
        weakSelf.alterViewWindow = nil;
        [weakSelf.previousWindow makeKeyAndVisible];
        
        if (weakSelf.closeCallBack) {
            weakSelf.closeCallBack();
        }
    }];
    
}



#pragma mark - PublicMethod
-(void)show
{
    __weak typeof(self) weakSelf = self;
    self.previousWindow = [UIApplication sharedApplication].keyWindow;
    [self.alterViewWindow makeKeyAndVisible];
    [self dl_setupViewColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] completion:^{
        [weakSelf dl_setupSubViewsFrame];

    }];
   
}
@end
