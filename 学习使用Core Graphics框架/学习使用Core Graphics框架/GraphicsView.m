//
//  GraphicsView.m
//  学习使用Core Graphics框架
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "GraphicsView.h"
#define MainScreenW [UIScreen mainScreen].bounds.size.width
#define MainScreenH [UIScreen mainScreen].bounds.size.height
@implementation GraphicsView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
       
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI
{
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-70, 50, 150, 140)];
//    label.backgroundColor=[UIColor whiteColor];
//    [self addSubview:label];
}
-(void)drawRect:(CGRect)rect
{
    
    CGContextRef context=UIGraphicsGetCurrentContext();//图像上下文相当于画布
    
    
//    //画线
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextSetLineWidth(context, 20);//线宽
//    CGContextMoveToPoint(context, 50, 80);
//    CGContextAddLineToPoint(context, 50, 280);
//    CGContextStrokePath(context);
////    画多边形
//     CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);//填充颜色
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddLineToPoint(context, 100, 300);
//    CGContextAddLineToPoint(context, 300, 300);
//    CGContextAddLineToPoint(context, 300, 100);
//    CGContextFillPath(context);//封闭路线
//    
//    //去掉一部分
//    CGContextMoveToPoint(context, 200, 200);
//    CGContextAddLineToPoint(context, 100, 300);
//    CGContextAddLineToPoint(context, 300, 300);
//    CGContextSetBlendMode(context, kCGBlendModeClear);
//    CGContextFillPath(context);
    //画圆
//    CGRect rect1 =CGRectMake(50, 100, 200, 200);
////    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
////    CGContextAddEllipseInRect(context, rect1);
////    CGContextFillPath(context);
//    //圆环
//    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
//    CGContextSetLineWidth(context, 15);
//    CGContextStrokeEllipseInRect(context, rect1);
////    CGContextStrokeRect(context, rect1);//画方形的
//    CGContextStrokePath(context);
    //曲线
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddQuadCurveToPoint(context, 200, 600, 300, 100);
////    CGContextAddArc(context, MainScreenW/2, MainScreenH/2, 100, 0, M_PI,1);//画圆
//    CGContextSetLineWidth(context, 5);
//    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
//    CGContextStrokePath(context);
//    CGContextMoveToPoint(context, MainScreenW/2, 100);
    
//     画多边形
    CGPoint lines[]={CGPointMake(self.frame.size.width/2, 20),CGPointMake(self.frame.size.width/2-50, 50),CGPointMake(self.frame.size.width/2+50,50)};
    CGContextAddLines(context, lines, 3);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);

    
    
    
}








































@end
