//
//  ViewController.m
//  CAEmitterLayer粒子喷射器
//
//  Created by yosemite on 16/9/30.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)CAEmitterLayer * emitterLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//      birthrate：粒子参数的速度乘数因子；每秒发射的粒子数量
//    
//      blueRange：一个粒子的颜色blue 能改变的范围；
//    
//      blueSpeed: 粒子blue在生命周期内的改变速度；
//    
//      color:粒子的颜色
//    
//      contents：是个CGImageRef的对象,既粒子要展现的图片；
//    
//      contentsRect：应该画在contents里的子rectangle：
//    
//      emissionLatitude：发射的z轴方向的角度
//    
//      emissionLongitude:x-y平面的发射方向
//    
//      emissionRange；周围发射角度
//    
//      emitterCells：粒子发射的粒子
//    
//      enabled：粒子是否被渲染
//    
//      greenrange: 一个粒子的颜色green 能改变的范围；
//    
//      greenSpeed: 粒子green在生命周期内的改变速度；
//    
//      lifetime：生命周期
//    
//      lifetimeRange：生命周期范围      lifetime= lifetime(+/-) lifetimeRange
//    
//      magnificationFilter：不是很清楚好像增加自己的大小
//    
//      minificatonFilter：减小自己的大小
//    
//    minificationFilterBias：减小大小的因子
//    
//    name：粒子的名字
//    
//    redRange：一个粒子的颜色red 能改变的范围；
//    
//    redSpeed; 粒子red在生命周期内的改变速度；
//    
//    scale：缩放比例：
//    
//    scaleRange：缩放比例范围；
//    
//    scaleSpeed：缩放比例速度：
//    
//    spin：子旋转角度
//    
//    spinrange：子旋转角度范围
//    
//    style：不是很清楚：
//    
//    velocity：速度
//    
//    velocityRange：速度范围
//    
//      xAcceleration:粒子x方向的加速度分量
//    
//      yAcceleration:粒子y方向的加速度分量
//    
//      zAcceleration:粒子z方向的加速度分量
    self.view.backgroundColor=[UIColor blackColor];
    [self setUpEmitter];
}

-(void)snow
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);//发射位置
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);//发射源大小
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;//发射模式
    snowEmitter.emitterShape	= kCAEmitterLayerLine;//发射源形状
    //    emitterDepth:决定粒子形状的深度联系：emitter shape
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //      seed：用于初始化随机数产生的种子
    //
    //      spin:自旋转速度
    //
    //      velocity：粒子速度
    
    //    随机颗粒的大小
    snowflake.scale = 0.2;//粒子的缩放比例
    //    emitterZposition:发射源的z坐标位置；
    snowflake.scaleRange = 0.5;
    
    //    缩放比列速度
    //        snowflake.scaleSpeed = 0.1;
    
    //    粒子参数的速度乘数因子；
    snowflake.birthRate		= 20.0;//粒子产生系数
    
    //生命周期
    snowflake.lifetime		= 60.0;//粒子生命周期
    //    alphaRange:  一个粒子的颜色alpha能改变的范围；
    //    alphaSpeed:粒子透明度在生命周期内的改变速度；
    //    粒子速度
    snowflake.velocity		= 20;				// falling down slowly
    snowflake.velocityRange = 10;
    //    粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    //    周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    //    自动旋转
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"fire"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];//装着CAEmitterCell对象的数组，被用于把粒子投放到layer上；
    [self.view.layer addSublayer:snowEmitter];
}

-(void)setUpEmitter
{
    CAEmitterLayer *fireEmitter=[CAEmitterLayer layer];
    CGRect boundRect=self.view.layer.bounds;
    fireEmitter.emitterPosition=CGPointMake(boundRect.size.width/2, boundRect.size.height);
    fireEmitter.emitterSize=CGSizeMake(1, 0);
    fireEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireEmitter.emitterShape	= kCAEmitterLayerLine;
    fireEmitter.renderMode		= kCAEmitterLayerAdditive;
    
    
    CAEmitterCell *rocket=[CAEmitterCell emitterCell];
    rocket.birthRate=6;
    rocket.emissionRange=0.12*M_PI;
    rocket.velocity=500;
    rocket.velocityRange=150;
    rocket.yAcceleration=0;
    rocket.lifetime=2.02;
    rocket.contents=(id)[UIImage imageNamed:@"ball"].CGImage;
    rocket.scale=0.2;
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    rocket.spinRange		= M_PI;
    
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;
    burst.scale				= 2.5;
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 666;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 deg
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    
    spark.contents			= (id) [[UIImage imageNamed:@"fire"] CGImage];
    spark.scale		        =0.5;
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.5;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // putting it together
    fireEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireEmitter];
    
}
- (CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y //纵向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue = y;
    
    animation.duration = time;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


- (CAAnimation *)SetupScaleAnimation{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:40.0];
    //scaleAnimation.repeatCount = MAXFLOAT;
    //scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    
    return scaleAnimation;
}

- (CAAnimation *)SetupGroupAnimation{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 3.0;
    groupAnimation.animations = @[[self moveY:3.0f Y:[NSNumber numberWithFloat:-300.0f]]];
    //groupAnimation.autoreverses = YES;
    //groupAnimation.repeatCount = MAXFLOAT;
    return groupAnimation;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
















@end
