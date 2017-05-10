//
//  ViewController.m
//  点击选中☑️Button
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "SeniorBtn.h"
#define MainScreeenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic,strong)SeniorBtn *lastBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr1=@[@"支付宝支付",@"微信支付",@"银行卡支付"];
    NSArray *arr2=@[@"使用支付宝介绍",@"使用微信介绍",@"使用银行卡介绍"];
    NSArray *arr3=@[@"矢量智能对象_26",@"矢量智能对象",@"矢量智能对象_88"];
    for (NSInteger i=0; i<3; i++) {
        SeniorBtn *btn=[[SeniorBtn alloc]initWithFrame:CGRectMake(0, 100+i*60, MainScreeenW, 60) :arr1[i] :arr2[i] :arr3[i]];
            if (i==0) {
            btn.isSelect=YES;
            _lastBtn=btn;
            btn.selectImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
        }else
        {
            btn.selectImage.image=[UIImage imageNamed:@"椭圆-4"];
        }
        if (i==0||i==1) {
            UIView *separatorLine=[[UIView alloc]initWithFrame:CGRectMake(0, btn.frame.origin.y+btn.frame.size.height, MainScreeenW, 1)];
            separatorLine.backgroundColor=[UIColor grayColor];
            [self.view addSubview:separatorLine];
        }
        
        btn.tag=i;
        [btn addTarget:self action:@selector(btnClickedd:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
       }
}

-(void)btnClickedd:(SeniorBtn*)btn
{
    
    if (_lastBtn==nil) {
        btn.isSelect=YES;
        btn.selectImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
        _lastBtn=btn;
    }
  /*  else if (_lastBtn==btn&&btn.tag==0) {
        btn.isSelect=NO;
        btn.selectImage.image=[UIImage imageNamed:@"椭圆-4"];
        _lastBtn=btn;
    }*/
    else if (_lastBtn!=nil&&_lastBtn==btn){
        btn.isSelect=YES;
        btn.selectImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
    }else if (_lastBtn!=btn&&_lastBtn!=nil){
        _lastBtn.isSelect=NO;
        _lastBtn.selectImage.image=[UIImage imageNamed:@"椭圆-4"];
        btn.isSelect=YES;
       btn.selectImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
        _lastBtn=btn;
    }
    
}

@end
