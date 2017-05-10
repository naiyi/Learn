//
//  ViewController.m
//  加速计CMMotionManager
//
//  Created by yosemite on 16/10/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
@interface ViewController () <UIAccelerometerDelegate>

/** 运动管理者 */
@property (nonatomic, strong) CMMotionManager *mgr; // 保证不死
@property (nonatomic,strong)UILabel *showLabel;
@end

@implementation ViewController

#pragma mark - 懒加载
- (CMMotionManager *)mgr
{
    if (_mgr == nil) {
        _mgr = [[CMMotionManager alloc] init];
    }
    return _mgr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.showLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 150, self.view.frame.size.width-200, 30)];
    self.showLabel.textColor=[UIColor orangeColor];
    [self.view addSubview:self.showLabel];
    self.showLabel.backgroundColor=[UIColor cyanColor];
    self.showLabel.textAlignment=NSTextAlignmentCenter;
    self.showLabel.font=[UIFont systemFontOfSize:22];
    
    // 1.判断加速计是否可用
    if (!self.mgr.isAccelerometerAvailable) {
        NSLog(@"加速计不可用");
        return;
    }
    
    // 2.设置采样间隔
    self.mgr.accelerometerUpdateInterval = 0.3;
    
    
    
    if (self.mgr.isAccelerometerAvailable){//判断加速计是否可用
        // 3.开始采样
        [self.mgr startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) { // 当采样到加速计信息时就会执行
            if (error) return;
            
            // 4.获取加速计信息
//            CMAcceleration acceleration = accelerometerData.acceleration;
//            NSLog(@"---x:%f+++ y:---%f+++ z:---%f+++", acceleration.x, acceleration.y, acceleration.z);
        }];
    }
    
    if (self.mgr.isGyroAvailable) {//判断陀螺仪是否可用
        [self.mgr startGyroUpdates];//开始 采样
    }
    
    
    
    
    if (![CMPedometer isStepCountingAvailable]) {
        NSLog(@"计步器不可用");
        return;
    }
    if ([CMPedometer isStepCountingAvailable]) {
        NSLog(@"计步器可用");
        CMPedometer *stepCounter = [[CMPedometer alloc] init];
        
        
        [stepCounter startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData *pedometerData, NSError *error) {
            NSLog(@"++%@++",error);
            if (error) return;
            // 4.获取采样数据
            self.showLabel.text=[NSString stringWithFormat:@"%@",pedometerData.numberOfSteps];
            NSLog(@"steps = %@", pedometerData.numberOfSteps);
        }];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CMRotationRate rate = self.mgr.gyroData.rotationRate;
    NSLog(@"~~x:%f y:~~%f z:~~%f", rate.x, rate.y, rate.z);
}
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"开始摇一摇");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇一摇被取消");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇一摇停止");
}

@end
