//
//  ViewController.m
//  NSURLssion
//
//  Created by yosemite on 16/9/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSInteger i=12;
    NSValue *value=[[NSValue alloc]initWithBytes:&i objCType:@encode(long)];
    
    [value getValue:&i];
    NSLog(@"++++%li+++++",i);
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
