//
//  ViewController.m
//  Masonry框架的使用
//
//  Created by YY on 16/12/1.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *bgview1=[[UIView alloc]init];
    [self.view addSubview:bgview1];
    bgview1.backgroundColor=[UIColor redColor];
    __weak typeof(self) WeakSelf =self;
    [bgview1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(@200);
//        make.height.mas_equalTo(@200);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.centerX.equalTo(WeakSelf.view);
//        make.centerY.equalTo(@-100);
        make.top.mas_equalTo(WeakSelf.view).with.offset(20);
    }];
    
    UIView *bgview2=[[UIView alloc]init];
    [self.view addSubview:bgview2];
    bgview2.backgroundColor=[UIColor orangeColor];
    [bgview2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@200);
//        make.height.equalTo(@200);
//        make.centerX.equalTo(WeakSelf.view);
//        make.top.mas_equalTo(bgview1.mas_bottom).with.offset(10);
//        make.top.left.bottom.and.right.equalTo(WeakSelf.view).with.inset(20);
//        make.top.bottom.right.and.left.equalTo(WeakSelf.view).with.insets(UIEdgeInsetsMake(100, 50, 100, 50));
        make.top.equalTo(bgview1.mas_bottom).with.offset(10);
//        make.left.right.equalTo(WeakSelf.view).with.inset(0);
        make.width.equalTo(@200);
        make.leftMargin.equalTo(@0);
        make.height.equalTo(@200);
    }];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
