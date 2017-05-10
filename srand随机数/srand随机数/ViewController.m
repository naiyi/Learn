//
//  ViewController.m
//  srand随机数
//
//  Created by yosemite on 16/9/21.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    这是用于初始化随机函数发生器的，计算机中的随机函数在生成一个随机数时需要用到一个称为随机数发生器的东西，如果不对其进行初始化，每次生成的随机数就会是相同的。
//    srand函数就用来初始化这个发生器，参数time(0)能够生成从1970年1月1日到当前机器时间的秒数，这个数在你每次执行程序的时候都会不断增长、变化，所以用它当做种子来初始化发生器，就会生成不同的随机数了。
//    NSLog(@"++++%ld+++",time(0));//返回1970年1月1号0点0时0分0秒到当前时间的秒数
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));//初始化随机函数发生器
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSLog(@"+++-%u-+++",index);
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    NSLog(@"----%@---",resultStr);
   
    NSLog(@"----%d---", rand());
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
