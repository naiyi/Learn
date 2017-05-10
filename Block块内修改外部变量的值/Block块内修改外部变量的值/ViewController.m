//
//  ViewController.m
//  Block块内修改外部变量的值
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
//__block NSString *str1=@"111";
static NSString *str2=@"222";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    [self setUpUI];

   
}
-(void)setUpUI{
    void(^myBlock)(NSString *str3)=^(NSString *str){
//        str1=str;
        str2=str;
    };
    myBlock(@"4");
//    NSLog(@"+++***%@****+++",str1);
    NSLog(@"+++&&&%@&&&+++",str2);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
