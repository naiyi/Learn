//
//  ViewController.m
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYAlertView.h"
#import "YYPopView.h"
#import "AlertView.h"
#import "YYBannerAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    YYAlertView *alertView=[[YYAlertView alloc] initWithWithImages:@[[UIImage imageNamed:@"1234"],[UIImage imageNamed:@"1234"],[UIImage imageNamed:@"1234"]] clickCallBack:^{
//        
//    } andCloseCallBack:^{
//        
//    }];
//    [alertView show];
    
//    [[AlertView sigle] titleArray:@[@"1",@"2"]];
    
//    [[YYBannerAlertView sigle] showAlertView];
   YYBannerAlertView *alertView= [[YYBannerAlertView alloc] initWithView];
    [alertView showAlertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
