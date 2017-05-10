//
//  ViewController.m
//  UIPasteboard剪切板
//
//  Created by yosemite on 16/10/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
    NSLog(@"剪切板的名字---%@----",pasteboard.name);
    NSLog(@"剪切板改变的次数--%li---",(long)pasteboard.changeCount);
    pasteboard.persistent=YES;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
