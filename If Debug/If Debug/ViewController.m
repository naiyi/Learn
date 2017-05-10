//
//  ViewController.m
//  If Debug
//
//  Created by yosemite on 16/9/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
//
#define MainScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//  #undef 取消以定义的宏
//  #if 如果条件为真，编译下面的代码
//  #ifndef 如果定义了这个宏，则编译下面的代码
//  #ifndef 如果没有定义了这个宏，则编译下面的代码
    
               //
#if DEBUG

    NSLog(@"+++++++++++");
//    ......  模拟数据
    
#else
     NSLog(@"=========");
//    ... 真实数据
    
#endif
    

//    //判断是真机还是模拟器
//#if TARGET_OS_IPHONE
//    NSLog(@"++++");
//    //iPhone Device
//#endif
//    
//#if TARGET_IPHONE_SIMULATOR
//     NSLog(@"-----");
//    //iPhone Simulator
//#endif
//                    22222
    
 /*
#ifdef MainScreenW  // 如果定义了这个宏MainScreenW执行下面的代码
    
    NSLog(@"++++");
#else //否则执行这里的代码

#endif
  
  */

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
