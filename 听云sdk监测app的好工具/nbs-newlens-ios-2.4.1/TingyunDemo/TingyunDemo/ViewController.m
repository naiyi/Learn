//
//  ViewController.m
//  TingyunDemo
//
//  Created by NBS on 16/6/30.
//  Copyright © 2016年 TGF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sendRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.tingyun.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"error:%@",connectionError);
        }
    }];
}
- (IBAction)forceCrash:(id)sender {
    NSArray *array = [NSArray arrayWithObjects:@"1", nil];
    NSLog(@"%@",[array objectAtIndex:2]);
}
- (IBAction)blockMainThread:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.tingyun.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];//发送一个同步请求，由于网址无法访问，会阻塞主线程
    sleep(6);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
