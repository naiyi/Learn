//
//  ViewController.m
//  iOS传值
//
//  Created by yosemite on 16/9/14.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "ViewController.h"

#import "SeconViewController.h"
@interface ViewController ()<PassTextDelegate>
{
    UILabel *_label;
}
@end
NSString *str1=nil;
@implementation ViewController

static ViewController *viewVC=nil;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewVC=[[ViewController alloc]init];
    });
    return viewVC;
}
-(void)dealloc
{
//    注销通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"notification" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    _label.backgroundColor=[UIColor orangeColor];
    
    [self.view addSubview:_label];
   
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 200, 100, 50);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNotification:) name:@"notification" object:nil];
    
}
//  通知传值
-(void)receiveNotification:(NSNotification*)notification
{
    _label.text=[notification.userInfo objectForKey:@"text"];
    
}

-(void)btnClicked:(UIButton *)btn
{
    SeconViewController *secondVC=[[SeconViewController alloc]init];
//    secondVC.delegate=self;
//    secondVC.textBlock=^(NSString *str){
//        _label.text=str;
//        NSLog(@"++++++");
//    };
    [self.navigationController pushViewController:secondVC animated:YES];
}
-(void)PassTextValue:(NSString *)text
{
   _label.text=text;
}

-(void)viewWillAppear:(BOOL)animated
{
    _label.text=_value1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
