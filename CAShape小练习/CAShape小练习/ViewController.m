//
//  ViewController.m
//  CAShape小练习
//
//  Created by yosemite on 16/10/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    CAShapeLayer *layer=[CAShapeLayer layer];
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 150, 150)];
    layer.path=path.CGPath;
    layer.lineWidth=5;
    layer.lineCap=kCALineCapButt;
    layer.fillColor=[UIColor clearColor].CGColor;
    layer.strokeColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
     */
//    self.view.backgroundColor=[UIColor orangeColor];
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 30, 30)];
    imageView.image=[UIImage imageNamed:@"flower"];
    imageView.backgroundColor=[UIColor orangeColor];
    imageView.layer.cornerRadius=15;
    [self.view addSubview:imageView];
    CABasicAnimation *rotateAnimation=[CABasicAnimation animationWithKeyPath:@"transform"];
    rotateAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DIdentity];
    rotateAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DRotate(imageView.layer.transform, M_PI, 0, 0, 1)];
    rotateAnimation.duration=1;
    rotateAnimation.repeatCount=CGFLOAT_MAX;
//    [imageView.layer addAnimation:rotateAnimation forKey:@"112"];
    CALayer *leafLayer=[CALayer layer];
    leafLayer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"leaf"].CGImage);
    leafLayer.bounds=CGRectMake(0, 0, 20, 20);
//    leafLayer.position=CGPointMake(30, 150);
//    leafLayer.backgroundColor=[UIColor cyanColor].CGColor;
    CAKeyframeAnimation *keyAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *v1=[NSValue valueWithCGPoint:imageView.layer.position];
    NSValue *v2=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10), imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v3=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+30, imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v4=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+60, imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v5=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+90, imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v6=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+120, imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v7=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+150, imageView.frame.origin.y+arc4random_uniform(30))];
    NSValue *v8=[NSValue valueWithCGPoint:CGPointMake(imageView.frame.origin.x+arc4random_uniform(10)+180, imageView.frame.origin.y+arc4random_uniform(30))];
    keyAnimation.values=@[v1,v2,v3,v4,v5,v6,v7,v8];
    keyAnimation.repeatCount=CGFLOAT_MAX;
//    keyAnimation.removedOnCompletion=YES;
//    keyAnimation.fillMode=kCAFillModeForwards;
    CABasicAnimation *roateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    roateAnimation.fromValue = @0;
    roateAnimation.toValue = @(M_PI/18.0 * (arc4random()%(36*6) ));
    
    CAAnimationGroup  *group = [CAAnimationGroup animation];
    group.animations = @[roateAnimation, keyAnimation];
    group.duration = 8;
    group.repeatCount=CGFLOAT_MAX;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [leafLayer addAnimation:group forKey:@"11"];
    [self.view.layer addSublayer:leafLayer];
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
