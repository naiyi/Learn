//
//  YYWebVideoController.m
//  51网易
//
//  Created by YY on 16/4/29.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYWebVideoController.h"

@interface YYWebVideoController ()

@end

@implementation YYWebVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];

    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
