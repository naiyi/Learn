//
//  ViewController.m
//  NSURLSessionTask
//
//  Created by yosemite on 16/9/28.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"sadsa"];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    [session getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        
    }];
    NSURLSessionDataTask *task1=[session dataTaskWithURL:[NSURL URLWithString:@"www.baidu.com"]];
    NSURLSessionDataTask *task2=[session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"www.baidu.com"]]];
    NSURLSessionUploadTask *task3=[session uploadTaskWithStreamedRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"123"]]];
    NSURLSessionDownloadTask *task4=[session downloadTaskWithURL:[NSURL URLWithString:@"123"]];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
