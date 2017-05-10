//
//  ViewController.m
//  友盟分享sdk
//
//  Created by yosemite on 16/9/27.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <UMSocialCore/UMSocialCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 200, 50);
    [btn setTitle:@"weixin" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:btn];
}
-(void)btnClicked
{
    [[UMSocialManager defaultManager]authWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {
        NSLog(@"++++res=%@   error=%@++++",result,error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
