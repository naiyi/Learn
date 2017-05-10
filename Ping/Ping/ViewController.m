//
//  ViewController.m
//  Ping
//
//  Created by YY on 2017/2/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "SimplePing.h"
#import "STDPingServices.h"

@interface ViewController ()<SimplePingDelegate>

{
    double _averPingValue;
}
@property (nonatomic,strong)SimplePing *pinger;
@property (nonatomic,strong)STDPingServices *services;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    SimplePing *pinger = [[SimplePing alloc] initWithHostName:@"www.baidu.com"];
//    self.pinger = pinger;
//    pinger.delegate = self;
//    pinger.addressStyle = SimplePingAddressStyleICMPv4;
//    [pinger start];
    
    self.services=[STDPingServices startPingAddress:@"www.baidu.com" callbackHandler:^(STDPingItem *pingItem, NSArray *pingItems) {
        
        NSLog(@"----%@----",pingItem);
       
       
            for (STDPingItem *item in pingItems) {
                  NSLog(@"~~~~~%f~~~~%lu~~~~%li",item.timeMilliseconds,(unsigned long)item.dateBytesLength,(long)item.timeToLive);
            }
        
    }];
//    NSLog(@"----%f----",_averPingValue);
}
- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address
{
    // 发送测试报文数据
    [self.pinger sendPingWithData:address];
}
- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
    [self.pinger stop];
}

- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"#%u sent", sequenceNumber);
}
//发送测试报文失败的回调方法
- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error
{
    NSLog(@"#%u send failed: %@", sequenceNumber, error);
}
// 接收到ping的地址所返回的数据报文回调方法
- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"+++=%@=+++",packet);
    NSLog(@"#----%u received, size=%zu", sequenceNumber, packet.length);
}
- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet
{
    NSLog(@"#####%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
