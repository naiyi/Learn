//
//  ViewController.m
//  CoreData
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYManager.h"
#import "Student.h"
@interface ViewController ()
{
    YYManager *_manager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _manager=[YYManager shareInstance];
    [_manager creatEntityWithModelName:@"1223"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
