//
//  ViewController.m
//  UITouch
//
//  Created by yosemite on 16/10/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *_imageview1;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _imageview1.image=[UIImage imageNamed:@"矢量智能对象 2"];
    _imageview1.layer.position=CGPointMake(100, 100);
    _imageview1.clipsToBounds=YES;
    [self.view addSubview:_imageview1];
    CGFloat lineW=self.view.frame.size.width-40;
    CGFloat lineH=self.view.frame.size.height-100;
    CGFloat lineWMargin=lineW/8;
    CGFloat lineHMargin=lineH/10;
    NSArray *arr1=[NSArray arrayWithObjects:@"車",@"馬",@"相",@"仕",@"将",@"仕",@"相",@"馬",@"車", nil];
    NSArray *arr2=[NSArray arrayWithObjects:@"车",@"马",@"象",@"士",@"帅",@"士",@"象",@"马",@"车", nil];
    
    for (NSInteger i=0; i<11; i++) {
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(20, 50+i*lineHMargin, lineW, 2)];
        view.backgroundColor=[UIColor blackColor];
        [self.view addSubview:view];
    
    }
    for (NSInteger j=0; j<9; j++) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(20+j*lineWMargin, 50, 2, lineH)];
        view.backgroundColor=[UIColor blackColor];
        [self.view addSubview:view];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 30, 30)];
        label.text=arr1[j];
        label.textColor=[UIColor redColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.layer.cornerRadius=15;
        label.clipsToBounds=YES;
        label.layer.position=CGPointMake(20+j*lineWMargin, 50);
        label.backgroundColor=[UIColor cyanColor];
        [self.view addSubview:label];
        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        label2.text=arr2[j];
        label2.textColor=[UIColor blackColor];
        label2.textAlignment=NSTextAlignmentCenter;
        label2.layer.cornerRadius=15;
        label2.clipsToBounds=YES;
        label2.layer.position=CGPointMake(20+j*lineWMargin, self.view.frame.size.height-50);
        label2.backgroundColor=[UIColor cyanColor];
        [self.view addSubview:label2];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    _imageview1.layer.position=point;
    CGPoint point1=[touch previousLocationInView:self.view];
    NSLog(@"point++++x=%f++++y=%f+++",point.x,point.y);
    NSLog(@"point1---x=%f----y=%f---",point1.x,point1.y);
    
    if (touch.tapCount==2) {
        NSLog(@"++++++++");
    }
}
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch=[touches anyObject];
//    CGPoint point=[touch locationInView:self.view];
//    _imageview1.layer.position=point;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
