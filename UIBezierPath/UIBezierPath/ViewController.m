//
//  ViewController.m
//  UIBezierPath
//
//  Created by YY on 16/11/30.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CAShapeLayer *_shapeLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBezierPath *circlePath=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y) radius:100 startAngle:M_PI endAngle:-M_PI clockwise:NO];
    _shapeLayer=[CAShapeLayer layer];
    _shapeLayer.frame=self.view.bounds;
    _shapeLayer.path=circlePath.CGPath;
    _shapeLayer.opacity=0.8;
    _shapeLayer.lineCap=kCALineCapRound;
    _shapeLayer.lineWidth=5;
    _shapeLayer.strokeColor=[UIColor lightGrayColor].CGColor;
    _shapeLayer.fillColor=[UIColor clearColor].CGColor;
    [self.view.layer addSublayer:_shapeLayer];
    
    
    NSMutableArray *colors=[NSMutableArray array];
    for (NSInteger hue=0; hue<=360; hue+=5) {
        UIColor *color=[UIColor colorWithHue:1.0*hue/360 saturation:1.0 brightness:1.0 alpha:1.0];
        [colors addObject:(id)[color CGColor]];
    }
    
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    gradientLayer.frame=self.view.bounds;
    gradientLayer.colors=colors;
    gradientLayer.mask=_shapeLayer;
    
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1, 0);
    [self.view.layer addSublayer:gradientLayer];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 60, 60);
    btn.center=CGPointMake(self.view.center.x, 100);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnClicked:(UIButton *)btn
{
    _shapeLayer.strokeStart =0.f;
    _shapeLayer.strokeEnd = 0.f;
    __block CGFloat end = 0.0f;
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        end += 0.1f;
        if (end >= 1) {
            [timer invalidate];
        }
        _shapeLayer.strokeEnd = end;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
