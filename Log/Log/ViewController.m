//
//  ViewController.m
//  Log
//
//  Created by YY on 2017/4/19.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "CATLog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CLogE(@"+++++++++++");
    CLogD(@"-----------");
    CLogI(@"===========");
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CATLog showTodayLogFile];
//    [CATLog showAllLogFile];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
