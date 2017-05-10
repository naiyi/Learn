//
//  ViewController.m
//  CALayer
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CALayer *layer=[CALayer layer];
//    layer.frame=CGRectMake(0,0, 100, 100);
//    
//   __block CGFloat x=0;
//    layer.backgroundColor=[UIColor greenColor].CGColor;
//    [self.view.layer addSublayer:layer];
//    layer.anchorPoint=CGPointMake(0, 0);
//    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0);
//    dispatch_source_set_event_handler(self.timer, ^{
//        
//        x+=2;
//        NSLog(@"%f",x);
//        layer.position=CGPointMake(x, 10);
//    });
//    dispatch_resume(self.timer);
    
    
//    CABasicAnimation
    /*
   //贝塞尔曲线画一个圆
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.strokeColor=[UIColor redColor].CGColor;//画圆曲线
    layer.fillColor=[UIColor greenColor].CGColor;//填充曲线
    layer.lineCap=kCALineCapSquare;//边缘线类型
    layer.path=path.CGPath;//从贝塞尔曲线获得形状
    layer.lineWidth=4;//线宽
    layer.strokeStart=0;//边框开始
    layer.strokeEnd=1;//边框结束  按比例
    [self.view.layer addSublayer:layer];
    
    */
    /*
//    贝塞尔曲线画不规则图形
    CGPoint point1=CGPointMake(100, 100);
    CGPoint point2=CGPointMake(100, 300);
    CGPoint point3=CGPointMake(300, 300);
    CGPoint point4=CGPointMake(300, 200);
    CGPoint point5=CGPointMake(350, 150);
    CGPoint point6=CGPointMake(300, 100);
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path closePath];
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=path.CGPath;
    layer.fillColor=[UIColor cyanColor].CGColor;
    layer.strokeColor=[UIColor redColor].CGColor;
    layer.lineWidth=5;
    layer.strokeStart=0;
    layer.strokeEnd=0.5;
    [self.view.layer addSublayer:layer];
    */
//    贝塞尔曲线画椭圆
    
    
//    UIView *view=[[UIView alloc]init];
//    [self.view addSubview:view];
//
//    UIBezierPath *path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 200, 100, 200) cornerRadius:50];
//    CAShapeLayer *layer=[CAShapeLayer layer];
//    layer.path=path.CGPath;
//    layer.fillColor=[UIColor redColor].CGColor;
//    [view.layer addSublayer:layer];
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(160, 220, 60, 150)];
//    label.backgroundColor=[UIColor orangeColor];
//    [view addSubview:label];
 
    
    
//    CAAnimation
//    CABasicAnimation
    /*
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 200, 300, 200)];
    CAShapeLayer *layer=[CAShapeLayer layer];
//    layer.frame=CGRectMake(100, 100, 100, 100);
    layer.strokeEnd=1;
    layer.strokeStart=0;
    layer.path=path.CGPath;
    layer.fillColor=[UIColor clearColor].CGColor;
    layer.strokeColor=[UIColor redColor].CGColor;
    layer.lineWidth=5;
    [self.view.layer addSublayer:layer];
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.beginTime=CACurrentMediaTime()+2;//2秒后执行
    pathAnima.duration = 3.0f;//动画执行时间
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];//设定动画的速度变化
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;//
//    pathAnima.repeatCount=CGFLOAT_MAX;//重复次数
//    pathAnima.autoreverses=YES;	//动画结束时是否执行逆动画
//    pathAnima.removedOnCompletion = NO;//这个属性默认为 YES,那意味着,在指定的时间段完成后,显示做后的状态
    [layer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
    */
    
//    贝塞尔曲线画曲线
    /*
    CGPoint startPoint=CGPointMake(50, 200);
    CGPoint controlPoint1=CGPointMake(100, 300);

    CGPoint controlPoint3=CGPointMake(150, 100);
    CGPoint endPoint=CGPointMake(200, 200);
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint3];
//    [path closePath];
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=path.CGPath;
    layer.lineWidth=1;
    layer.strokeEnd=1;
    layer.strokeStart=0;
    layer.fillColor=[UIColor clearColor].CGColor;
    layer.strokeColor=[UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
 
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue=[NSNumber numberWithInt:0];
    animation.toValue=[NSNumber numberWithInt:1];
    animation.duration=2;
    animation.repeatCount=CGFLOAT_MAX;
    [layer addAnimation:animation forKey:@"12"];
    */
//    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 160, 100)];
    imageview.image=[UIImage imageNamed:@"111.png"];
    [self.view addSubview:imageview];
////    旋转
//    /*
//    CATransform3D rotationTransform  = CATransform3DMakeRotation(M_PI, 1, 0,0);
//    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.duration=3;
//    animation.repeatCount=CGFLOAT_MAX;
//    
//    animation.removedOnCompletion=NO;
//    animation.fillMode=kCAFillModeForwards;
//    animation.toValue=[NSValue valueWithCATransform3D:rotationTransform ];
//    [imageview.layer addAnimation:animation forKey:@"123"];
//    */
////    平移   中心位置发生变化
////
    CABasicAnimation *animation1=[CABasicAnimation animationWithKeyPath:@"position"];
    animation1.duration=3;
    animation1.repeatCount=CGFLOAT_MAX;
    
    animation1.removedOnCompletion=NO;
    animation1.fillMode=kCAFillModeForwards;
//     结合使用动画保持最后状态
    
    
    animation1.toValue=[NSValue valueWithCGPoint:CGPointMake(130, 300) ];
    [imageview.layer addAnimation:animation1 forKey:@"123"];
//
////    图片变换
//    
//    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"contents"];
////    animation.duration=3;
////    animation.repeatCount=CGFLOAT_MAX;
//    animation.delegate=self;
//    animation.removedOnCompletion=NO;
//    animation.fillMode=kCAFillModeForwards;
//    animation.toValue=(id)[UIImage imageNamed:@"222"].CGImage;
////    [imageview.layer addAnimation:animation forKey:@"123"];
//    
////    组合动画的实现
//    CAAnimationGroup *group=[CAAnimationGroup animation];
//    group.duration=3;
//    group.repeatCount=100;
//    group.delegate=self;
//    group.animations=@[animation1,animation];
//    [imageview.layer addAnimation:group forKey:@"12"];
    
    
}

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"++++++");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"--------");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
