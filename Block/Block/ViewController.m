//
//  ViewController.m
//  Block
//
//  Created by yosemite on 16/9/13.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __block int a= 5;
    void(^myBlock)(void)=^{
        a=2;
    };
    myBlock();
    NSLog(@"+++%d++",a);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
