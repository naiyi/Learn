//
//  ViewController.m
//  CATransform3D
//
//  Created by yosemite on 16/10/11.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked)];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 80)];
    label.backgroundColor=[UIColor cyanColor];
    label.text=@"12345";
    label.tag=0x100;
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
//        label.transform=CGAffineTransformRotate(label.transform, M_PI/4);//在原来的基础上旋转
//        label.transform=CGAffineTransformScale(label.transform, 1, 0.3);//在原来的基础上缩放
//        label.transform=CGAffineTransformTranslate(label.transform, 0.1, 0.1);//在原来的基础上平移
//        label.transform=CGAffineTransformMakeScale(0.8, 1);//只变化一次
//        label.transform=CGAffineTransformMakeRotation(M_PI);//只变化一次
//        label.transform=CGAffineTransformMakeTranslation(1, 1);//只变化一次
        
        
        
//        label.layer.transform=CATransform3DRotate(label.layer.transform, M_PI/4, 1, 2, 0.5);
//        label.layer.transform=CATransform3DScale(label.layer.transform, 1.2, 1.2, 0.8);
//        label.layer.transform=CATransform3DTranslate(label.layer.transform, 0.5, 0.4, 0.2);
    });
    dispatch_resume(_timer);
}



-(void)rightBarButtonItemClicked
{
//    UILabel *label=[self.view viewWithTag:0x100];
//    label.transform=CGAffineTransformScale(label.transform, 1.2, 1);
//    label.layer.transform=CATransform3DRotate(label.layer.transform, M_PI/4, 1, 2, 0.5);
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
