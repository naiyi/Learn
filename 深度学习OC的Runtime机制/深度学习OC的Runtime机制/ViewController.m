//
//  ViewController.m
//  深度学习OC的Runtime机制
//
//  Created by YY on 2017/3/22.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person.h"
#import "UIImage+Category.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    Person *p=[[Person alloc] init];
    [p eatFoods];// 实质是: objc_msgSend(p,@selector(eatFoods));
//    [p performSelector:@selector(eat)];
    
    // 需求：给imageNamed方法提供功能，每次加载图片就判断下图片是否加载成功。
    // 步骤一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString *)name;
    // 步骤二：交换imageNamed和imageWithName的实现，就能调用imageWithName，间接调用imageWithName的实现。
    UIImage *image=[UIImage imageWithName:@"123"];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image=image;
    [self.view addSubview:imageView];
    
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
