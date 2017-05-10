//
//  YYMenuView.h
//  滑动菜单案例01
//
//  Created by YY on 16/5/13.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
//  定义一个 block 块带一个NSInteger类型的参数;
typedef void (^btnClicBlock)(NSInteger index);
@interface YYMenuView : UIView
//  默认未选中文字颜色,默认黑色
@property (nonatomic,strong)UIColor *titleNomalColor;
//  选中是的文字颜色,默认红色
@property (nonatomic,strong)UIColor *titleSelectColor;
//  默认未选中文字大小,默认15;
@property (nonatomic,strong)UIFont *titleNomalFont;
//  选中时文字大小,默认18;
@property (nonatomic,strong)UIFont *titleSelectFont;
//  默认选中第一个
@property (nonatomic,assign)NSInteger defaultIndex;
//  点击后的 block
@property (nonatomic,copy)btnClicBlock block;
@property (nonatomic, assign) NSInteger currentIndex;

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray clickBlock:(btnClicBlock) block;

@end
