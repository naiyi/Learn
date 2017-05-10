//
//  ViewController.m
//  NSURLSession
//
//  Created by yosemite on 16/10/20.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate,NSURLSessionDownloadDelegate>
@property (nonatomic,strong)NSData *resumeData;
@property (nonatomic,strong)NSURLSessionDownloadTask *downloadTask;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSURLSession
//    NSURLSessionTask
//    NSURLSessionDataTask          发送post或get请求
//    NSURLSessionDownloadTask      支持断点下载
//    NSURLSessionUploadTask        上传
    
    NSURL *url=[NSURL URLWithString:@"http://123.57.66.127/qctt-api/5.2/index.php/Adverqctt/getFocus"];
    /*
//    简单的get请求1
    
    NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"-----%@------",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    [dataTask resume];
     */
//    简单的post请求1
    
    /*
    NSMutableURLRequest *requestM=[NSMutableURLRequest requestWithURL:url];
    requestM.HTTPMethod=@"POST";
    requestM.HTTPBody=[NSData data];
    NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession] dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [dataTask resume];
     */
//    复杂的get请求2
    /*
    NSURL *URL2=[NSURL URLWithString:@"http://123.57.66.127/qctt-api/5.2/index.php/AppCar/getBrandCarTypeList"];
    NSMutableURLRequest *requestM=[NSMutableURLRequest requestWithURL:URL2];
    requestM.HTTPMethod=@"POST";
    requestM.HTTPBody = [@"brandId=85" dataUsingEncoding:NSUTF8StringEncoding];
    [requestM setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    

    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest=20;
    configuration.timeoutIntervalForResource=40;
    configuration.allowsCellularAccess=YES;
    configuration.requestCachePolicy=NSURLRequestReloadIgnoringLocalCacheData;
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"-----%@------",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    [dataTask resume];
    */
    
//    下载
    
    /*
    NSURL *url1=[NSURL URLWithString:@"http://img2.3lian.com/2014/c7/12/d/77.jpg"];
    NSURLSessionDownloadTask *downloadTask=[[NSURLSession sharedSession] downloadTaskWithURL:url1 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"+++++%@+++++",location);
        NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, NO) objectAtIndex:0];
        [[NSFileManager defaultManager]moveItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:nil];
        NSLog(@"----%@-----",path);
    }];
    [downloadTask resume];
    */
//    上传
    /*
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask=[session uploadTaskWithRequest:[NSURLRequest requestWithURL:url] fromData:[NSData data] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [uploadTask resume];
    */
    
//    断点下载
    /*
     NSURLSession *session=[NSURLSession sharedSession];
    self.downloadTask=[session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData=resumeData;
    }];
   
    self.downloadTask =[session downloadTaskWithResumeData:self.resumeData completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    
    [self.downloadTask resume];
//    [self.downloadTask suspend];暂停下载
     
     */
}


#pragma mark  -----NSURLSessionDataDelegate代理方法-------
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"接收到服务器的响应");
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"接收到服务器的数据");
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    self.resumeData=error.userInfo[NSURLSessionDownloadTaskResumeData];
    NSLog(@"请求成功或失败");
}


#pragma mark   ------NSURLSessionDownloadDelegate代理方法------
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"下载完成调用");
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
