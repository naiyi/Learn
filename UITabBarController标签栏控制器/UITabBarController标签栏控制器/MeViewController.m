//
//  MeViewController.m
//  UITabBarController标签栏控制器
//
//  Created by yosemite on 16/10/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "MeViewController.h"
#define MainScreenW [UIScreen mainScreen].bounds.size.width
#define MainScreenH [UIScreen mainScreen].bounds.size.height
@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    self.title=@"我";
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"AddGroupMemberBtnHL@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(btnClicked)];
    
    
    
    
   
}
-(void)btnClicked
{
    NSLog(@"<<<<<<<<<<");
    [self setUpPopView];
    
}

-(void)setUpPopView
{
    UIView *popView=[[UIView alloc]initWithFrame:CGRectMake(MainScreenW-100, 80, 95, 120)];
    UIBezierPath *path=[UIBezierPath bezierPath];
    CGPoint point1=CGPointMake(MainScreenW-30, 70);
    CGPoint point2=CGPointMake(MainScreenW-40, 80);
    CGPoint point3=CGPointMake(MainScreenW-100, 80);
    CGPoint point4=CGPointMake(MainScreenW-100, 210);
    CGPoint point5=CGPointMake(MainScreenW-5, 210);
    CGPoint point6=CGPointMake(MainScreenW-5, 80);
    CGPoint point7=CGPointMake(MainScreenW-20, 80);
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=path.CGPath;
    layer.fillColor=[UIColor redColor].CGColor;
    [popView.layer addSublayer:layer];
   
    [self.view addSubview:popView];
    CGFloat btnW=90;
    CGFloat btnH=40;
    NSArray *titles=@[@"扫一扫",@"发起群聊",@"添加朋友"];
    for (NSInteger i=0; i<3; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(0, btnH*i, btnW, btnH);
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor=[UIColor whiteColor];
        btn.tag=i;
        [popView addSubview:btn];
    }
   

}
-(void)btnClicked:(UIButton *)btn
{
    NSLog(@"++++%ld++++",(long)btn.tag);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
