//
//  ViewController.m
//  TestDemo
//
//  Created by YY on 2017/4/18.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIApplicationShortcutItem *item=
    
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    // 创建一个标签，并配置相关属性。
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"分享" localizedSubtitle:@"么么哒" icon:icon userInfo:nil];
    // 将标签添加进Application的shortcutItems中。
    [UIApplication sharedApplication].shortcutItems = @[item];
    
    
    
    
//    NSString*str1=[NSString stringWithFormat:@"hello"];
//    NSString *str2=[NSString stringWithFormat:@"hello"];
//    if ([str1 isEqualToString: str2]) {
//        NSLog(@"相等");
//    }else{
//        NSLog(@"不相等");
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
