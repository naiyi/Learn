//
//  PopupView.m
//  UITabBarController标签栏控制器
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "PopupView.h"
#define MainScreenW [UIScreen mainScreen].bounds.size.width
#define MainScreenH [UIScreen mainScreen].bounds.size.height
@implementation PopupView

-(void)drawRect:(CGRect)rect
{
    CGFloat leftPadding = 50;
    CGFloat triangleWidth = 15;
    CGPoint sPoints[3];
    sPoints[0] = CGPointMake(MainScreenW - leftPadding, 0);
    sPoints[1] = CGPointMake(MainScreenW - leftPadding - triangleWidth / 2, triangleWidth);
    sPoints[2] = CGPointMake(MainScreenW - leftPadding + triangleWidth / 2, triangleWidth);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFill);
}


@end
