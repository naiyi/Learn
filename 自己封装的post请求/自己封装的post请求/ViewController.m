//
//  ViewController.m
//  自己封装的post请求
//
//  Created by YY on 2017/4/25.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [YYNetworking PostWithURL:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryHotsList" Params:@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip"} success:^(id responseObject) {
        NSLog(@"++++%@++++++",[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil]);
    } failure:^(NSString *error) {
        NSLog(@"====%@===",error);
    }];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
