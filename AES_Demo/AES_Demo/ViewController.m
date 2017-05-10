//
//  ViewController.m
//  AES_Demo
//
//  Created by jiangys on 15/8/28.
//  Copyright (c) 2015年 uxiaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "SecurityUtil.h"
#import "GTMBase64.h"

@interface ViewController ()

@end

//示例的偏移量及key在SecurityUtil.m文件中
//这里是CBC加密模式，安全性更高
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加密
    NSString *encryptDate=[SecurityUtil encryptAESData:@"abc"];
    NSLog(@"base64EncryptDate %@",encryptDate);
    
    //解密
    NSString *strDecrypt=@"5z9WEequVr7qtd+WoxV+Kw==";
    NSString *decodeData=[SecurityUtil decryptAESData:strDecrypt];
    NSLog(@"decodeData %@",decodeData);
}

@end
