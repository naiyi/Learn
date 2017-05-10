//
//  ViewController.m
//  联网权限
//
//  Created by YY on 2017/4/14.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "STDPingServices.h"
@import CoreTelephony;

@interface ViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic,strong)STDPingServices *services;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CTCellularData *cellularData = [[CTCellularData alloc]init];
//    cellularData.cellularDataRestrictionDidUpdateNotifier =  ^(CTCellularDataRestrictedState state){
//        //获取联网状态
//        switch (state) {
//            case kCTCellularDataRestricted:
//                NSLog(@"Restricrted");
//                break;
//            case kCTCellularDataNotRestricted:
//                NSLog(@"Not Restricted");
//                break;
//            case kCTCellularDataRestrictedStateUnknown:
//                NSLog(@"Unknown");
//                break;
//            default:
//                break;
//        };
//    };
//    
////    CTCellularData *cellularData = [[CTCellularData alloc]init];
//    CTCellularDataRestrictedState state = cellularData.restrictedState;
//    switch (state) {
//        case kCTCellularDataRestricted:
//            NSLog(@"Restricrted1");
//            break;
//        case kCTCellularDataNotRestricted:
//            NSLog(@"Not Restricted1");
//            break;
//        case kCTCellularDataRestrictedStateUnknown:
//            NSLog(@"Unknown1");
//            break;
//        default:
//            break;
//    }
//    
//    WKWebViewConfiguration *config=[[WKWebViewConfiguration alloc] init];
//    WKWebView *webview=[[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
//    webview.navigationDelegate=self;
//    [self.view addSubview:webview];
//    
    __weak typeof(self) weakself = self;
    self.services=[STDPingServices startPingAddress:@"www.baidu.com" callbackHandler:^(STDPingItem *pingItem, NSArray *pingItems) {
        NSLog(@"----%@----",pingItems);
        
    }];
    
}


@end
