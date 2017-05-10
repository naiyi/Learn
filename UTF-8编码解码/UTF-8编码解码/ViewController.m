//
//  ViewController.m
//  UTF-8编码解码
//
//  Created by YY on 16/12/9.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *str1=[NSString stringWithFormat:@"https:baidu.com"];
//      编码
    NSString *str3=[NSString stringWithFormat:@"https:baidu.com"];
    NSData *data=[str3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str2=[data base64EncodedStringWithOptions:0];
     NSLog(@"---str2------str2=%@-----",str2);
//      解码
    NSData *data1=[[NSData alloc] initWithBase64EncodedString:str2 options:0];
    NSString *str4=[[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
    NSLog(@"--str4-----str4=%@-----",str4);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
