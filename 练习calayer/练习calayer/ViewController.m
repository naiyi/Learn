//
//  ViewController.m
//  练习calayer
//
//  Created by yosemite on 16/10/19.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    /*
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    gradientLayer.frame=self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    gradientLayer.colors=@[(__bridge id)([UIColor redColor].CGColor),(__bridge id)([UIColor greenColor].CGColor),(__bridge id)([UIColor blueColor].CGColor)];
    gradientLayer.locations=@[@0.1,@0.2,@0.3];
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1, 1);
    */
    /*
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    replicator.instanceCount = 3;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 100, 0);
    replicator.instanceTransform = transform;
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;

    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10.0f, 10.0f, 30.0f, 30.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
 */
   
    
    
    
    
    
}


































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
