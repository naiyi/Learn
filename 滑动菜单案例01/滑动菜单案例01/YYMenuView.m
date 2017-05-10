//
//  YYMenuView.m
//  滑动菜单案例01
//
//  Created by YY on 16/5/13.
//  Copyright © 2016年 YY. All rights reserved.
//
#define MainScreenW ([UIScreen mainScreen].bounds.size.width)
#define MAX_TitleNumInWindow 5
#import "YYMenuView.h"
@interface YYMenuView ()
{
    UIButton *_lastBtn;
}
@property (nonatomic,strong)NSMutableArray *btns;
@property (nonatomic,strong)NSArray *titles;
@property (nonatomic,strong)UIButton *titleBtn;
@property (nonatomic,strong)UIScrollView *bgScrollView;
@property (nonatomic,strong)UIView *selectLine;
@property (nonatomic,assign)CGFloat btn_w;
@end
@implementation YYMenuView
-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray clickBlock:(btnClicBlock)block
{
    if (self=[super initWithFrame:frame]) {
        
        _btn_w=0.0;
        if (titleArray.count<MAX_TitleNumInWindow+1) {
            _btn_w=MAX_TitleNumInWindow/titleArray.count;
        }else{
            _btn_w=MainScreenW/MAX_TitleNumInWindow;
        }
        _titles=titleArray;
        _defaultIndex=1;
        _btns=[[NSMutableArray alloc]initWithCapacity:0];
        _titleNomalColor=[UIColor blackColor];
        _titleSelectColor=[UIColor redColor];
        _titleNomalFont=[UIFont systemFontOfSize:16];
        _titleSelectFont=[UIFont systemFontOfSize:22];
        _bgScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MainScreenW, self.frame.size.height)];
        _bgScrollView.showsHorizontalScrollIndicator=NO;
        _bgScrollView.contentSize=CGSizeMake(_btn_w*titleArray.count, self.frame.size.height);
        [self addSubview:_bgScrollView];
    }
    _selectLine=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, _btn_w, 2)];
    _selectLine.backgroundColor=_titleSelectColor;
    [_bgScrollView addSubview:_selectLine];
    for (int i=0; i<titleArray.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(_btn_w*i, 0, _btn_w, self.frame.size.height-2);
        btn.tag=i+1;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.titleLabel.font=_titleNomalFont;
        [_bgScrollView addSubview:btn];
        [_btns addObject:btn];
        if (i==0) {
            _titleBtn=btn;
            btn.selected=YES;
            btn.titleLabel.font=_titleSelectFont;
        }
        self.block=block;
    }
    return self;
}

-(void)btnClicked:(UIButton *)btn{
    if (self.block) {
        self.block(btn.tag);
    }
    if (btn.tag==_defaultIndex) {
        return;
    }
    else{
        _titleBtn.titleLabel.font = _titleNomalFont;
        _titleBtn.selected=!_titleBtn.selected;
        
        _titleBtn=btn;
         btn.titleLabel.font=_titleSelectFont;
        _titleBtn.selected=YES;
        _defaultIndex=btn.tag;
    }
    
   
//    计算偏移量
    CGFloat offsetX=btn.frame.origin.x-2*_btn_w;
    if (offsetX<0) {
        offsetX=0;
    }
    CGFloat maxOffsetX=_bgScrollView.contentSize.width-MainScreenW;
    if (offsetX>maxOffsetX) {
        offsetX=maxOffsetX;
    }
    [UIView animateWithDuration:0.2 animations:^{
        [_bgScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        _selectLine.frame=CGRectMake(btn.frame.origin.x, self.frame.size.height-2, btn.frame.size.width, 2);
    }];
}
-(void)setTitleNomalColor:(UIColor *)titleNomalColor
{
    _titleNomalColor=titleNomalColor;
    [self updateView];
}
-(void)setTitleSelectColor:(UIColor *)titleSelectColor
{
    _titleSelectColor=titleSelectColor;
    [self updateView];
}
-(void)setTitleNomalFont:(UIFont *)titleNomalFont
{
    _titleNomalFont=titleNomalFont;
    [self updateView];
}
-(void)setDefaultIndex:(NSInteger)defaultIndex
{
    _defaultIndex=defaultIndex;
    [self updateView];
}
-(void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex=currentIndex;
    UIButton *btn = _btns[currentIndex];
    [self btnClicked:btn];
    [self updateView];

}
-(void)updateView
{
    for (UIButton *btn in _btns) {
        [btn setTitleColor:_titleNomalColor forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font=_titleNomalFont;
        _selectLine.backgroundColor=_titleSelectColor;
        if (btn.tag-1==_defaultIndex-1) {
            _titleBtn=btn;
            btn.selected=YES;
        }
    else
        {
        btn.selected=NO;
        }
    }
}






@end
