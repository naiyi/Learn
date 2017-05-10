//
//  ViewController.m
//  NSCharacterSet
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
//    NSCharacterSet和NSMutableCharacterSet是用来表示一组Unicode字符,它经常与NSString及NSScanner组合起来使用
    
//    自定义
    [NSCharacterSet characterSetWithCharactersInString:@"hello"];
    NSCharacterSet *set=[NSCharacterSet characterSetWithRange:NSMakeRange(48, 5)];
//    判断2是否在decimalDigitCharacterSet中
   BOOL is=[[NSCharacterSet decimalDigitCharacterSet]characterIsMember:50];
    NSLog(@"＋＋＋%i＋＋＋",is);
   BOOL iss=[[NSCharacterSet decimalDigitCharacterSet] isSupersetOfSet:set];
    NSLog(@"＋＋＋--%i--＋＋＋",iss);

    NSMutableCharacterSet *set1 = [NSMutableCharacterSet characterSetWithCharactersInString:@"Hell"];
    NSMutableCharacterSet *set2 = [NSMutableCharacterSet characterSetWithCharactersInString:@"ello"];
    //去掉某些字符
    [set2 removeCharactersInString:@"e"]; //--->l, o
    NSLog(@"***%@***",set2);
    //加上某些字符
    [set2 addCharactersInString:@"e"];    //--->e, l, o
    NSLog(@"***%@***",set2);
    //set相加
    [set2 formUnionWithCharacterSet:set1]; //--->H,e,l,o
    NSLog(@"***%@***",set2);
    //set交集
    [set2 formIntersectionWithCharacterSet:set1]; //--->e,l
    NSLog(@"***%@***",set2);
    //set取反
    [set2 invert];
    NSLog(@"***%@***",set2);
    //例子1:去除两边的空格
    [@"  aaa   " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //例子2:通过数字把字符串变成数组
    [@"a1aa2aaa3aaaa4aaaaa" componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
