//
//  ViewController.m
//  initialize和init的区别
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Son.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Father *father1=[[Father alloc]init];
    
    Father *father2=[[Father alloc]init];
    Father *father3=[[Father alloc]init];
    Son *son=[[Son alloc]init];
    NSLog(@"%@-%@-%@-%@",father1,father2,father3,son);
    
}
/*
2016-09-29 10:08:46.381 initialize和init的区别[747:18144] +++Father中的 initialize 方法执行+++
2016-09-29 10:08:46.382 initialize和init的区别[747:18144] ++Father中的 init 方法执行++
2016-09-29 10:08:46.382 initialize和init的区别[747:18144] ++Father中的 init 方法执行++
2016-09-29 10:08:46.382 initialize和init的区别[747:18144] ++Father中的 init 方法执行++
 
 initialize方法执行一次
 而init执行三次
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
