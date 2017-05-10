//
//  ViewController.m
//  AFNetworking的使用
//
//  Created by yosemite on 16/10/20.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#define urlString @"http://123.57.66.127/qctt-api/5.2/index.php/AppCar/getBrandCarTypeList"
#define  urlstring @"https://sov.aeroip.net:8443/crm-webapp/phone_edituserinfo"
#define videoUrlstring @"http://v.baidu.com/link?url=dm_00pw_klemzFaU2vO4w7zo2Cc1yuX_dCEHtgd-yB9KwhC-tqPQIQDpKn0Cgz_gv-Lpi1WjzS5ob1Id3PZwXyfe3ye3mG5LDweH79DmIDpk3OAGvnQyx0g..&page=videoMultiNeed"
@interface ViewController ()

@end

@implementation ViewController
char BASE_URL[] = "https://sov.aeroip.net:8443/crm-webapp/phone_edituserinfo";
char EDITPROFILE[] = "/phone_edituserinfo";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"85",@"brandId", nil];
//    NSDictionary *dict1=@{@"brandId":@"85"};
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];//声明上传的是普通格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//声明获取到的数据格式
//    NSDictionary *dict2=@{@"receiver":@"self",@"requestIdentifier":@"0x10"};
    
//    [manager POST:urlString parameters:dict1 progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"---%@---",[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
//    
//    
////    上传带进度
//    [manager POST:@"" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
    // 把图片转换成data
//    NSData *data = UIImagePNGRepresentation(<#UIImage * _Nonnull image#>);
    // 拼接数据到请求题中
//    [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
    /******** 2.通过路径上传沙盒或系统相册里的图片 *****/
    //        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
    //          // 打印上传进度
//    NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
    
//    下载带进度
    [manager GET:videoUrlstring parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
      NSLog(@"%lf",1.0 *downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@">>>>>>>>>>>>>>>>>%@<<<<<<<<<<<<<<<",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    AFNetworkReachabilityManager *manager1=[AFNetworkReachabilityManager sharedManager];
    [manager1 setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"Wi-Fi状态");
                break;
                
            default:
                break;
        }
    }];
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
