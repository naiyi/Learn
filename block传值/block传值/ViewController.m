//
//  ViewController.m
//  block传值
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 300, 80, 50);
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:btn];
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 160, 30)];
    self.textField.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:self.textField];
    self.textField.secureTextEntry=NO;
    self.textField.placeholder=@"请输入...";
    
    
}


-(void)btnClicked:(UIButton *)btn{
    NextViewController*nextVC=[[NextViewController alloc]init];
    nextVC.block=^(NSString *titstring){
        
        titstring=self.textField.text;
        NSLog(@"%@",titstring);
    };
    [self.navigationController pushViewController:nextVC animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
