//
//  ViewController.m
//  const   static  extern 的用法
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
NSString *const Key=@"value";//全局只读变量key  //static修饰的全局只读变量只能本文件访问

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
//  static修饰函数时，被修饰的函数被称为静态函数，使得外部文件无法访问这个函数，仅本文件可以访问。

//  extern它的作用是声明外部全局变量。这里需要特别注意extern只能声明，不能用于实现。
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    int i=0;
    i=i+2;
    static int a=0;//修饰局部变量时      保证局部变量永远只初始化一次，在程序的运行过程中永远只有一份内存，  生命周期类似全局变量了，但是作用域不变。
    a=a+2;
    NSLog(@"++++i==%d++++a==%d+++++",i,a);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
