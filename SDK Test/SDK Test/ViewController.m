//
//  ViewController.m
//  SDK Test
//
//  Created by YY on 2017/4/28.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "SnapWiFiSDK.h"
#import "AFNetworking.h"
#import "ApplicationRuntime.h"

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>


#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
@interface ViewController ()
@property (nonatomic,strong) dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[SnapWiFiSDK shareWiFiInfo] queryConfigurationInformation:@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip"} success:^(id responseObject) {
//        NSLog(@"----%@----",[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil]);
//    } failure:^(NSError *erro) {
//        NSLog(@"----%@----",erro);
//    }];
//    
    
   
    
   
    
//    
//    [[SnapWiFiSDK shareWiFiInfo] getWiFiHotInformation:@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip"} success:^(id responseObject) {
//        NSDictionary *JSON=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//        NSLog(@"++++%@++++",JSON);
//        for (NSDictionary  *dict in [JSON objectForKey:@"object"]) {
//            if ([[dict objectForKey:@"ssid"]isEqualToString:@"AeroIP"]) {
//                NSLog(@"~~~~~~~~%@~~~~~",[[SnapWiFiSDK shareWiFiInfo] decryptAESString:[dict objectForKey:@"password"]]);
//            }
//        }
//    } failure:^(NSError *error) {
//        
//    }];
    [UIApplication sharedApplication].idleTimerDisabled = YES;
//    [[SnapWiFiSDK shareWiFiInfo] calculatePingValue:^(NSString *pingValue) {
//        NSLog(@"++++++%@+++++",pingValue);
//    }];

    
    

//        [[SnapWiFiSDK shareWiFiInfo] calculateExchangeData:^(double exchangeData) {
//            [[SnapWiFiSDK shareWiFiInfo] calculatePingValue:^(NSString *pingValue) {
//                
//                NSLog(@"====%.4f====%@====",exchangeData,pingValue);
//            }];
//            
//        }];

//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 2 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        [[SnapWiFiSDK shareWiFiInfo]calculateData:^(NSTimeInterval connectTime, double data,NSTimeInterval breakTime) {
//            NSLog(@"======%f======%f======%f===",connectTime,data,breakTime);
//        }];
//    });
//    dispatch_resume(timer);
//    self.timer=timer;
    
    
    
//    
//    [[SnapWiFiSDK shareWiFiInfo] updateCollectionInformation:@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip",@"closetime":[NSNumber numberWithLong:1493966070000],@"hrid":@"1196659",@"traffic":@"10"} success:^(id responseObject) {
//        NSLog(@"=====%@=====",[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil]);
//    } failure:^(NSError *erro) {
//        
//    }];
    
    [[SnapWiFiSDK shareWiFiInfo] calculateExchangeData:^(double exchangeData) {
        NSLog(@"=====%f====",exchangeData);
    }];
    

}

- (double )getGprsWifiFlowIOBytes
{
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1) {
        return 0;
    }
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        
        //Wifi
        if (strncmp(ifa->ifa_name, "lo", 2)) {
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            oBytes += if_data->ifi_obytes;
            //            NSLog(@"%s :iBytes is %d, oBytes is %d", ifa->ifa_name, iBytes, oBytes);
        }
    }
    
    freeifaddrs(ifa_list);
    
    uint32_t bytes = 0;
    
    bytes = iBytes+oBytes;
    
    //    NSLog(@"%d",bytes);
    return (double)bytes/(1024*1024);
    //将bytes单位转换
    //    if(bytes < 1024)        // B
    //    {
    //        return [NSString stringWithFormat:@"%dB", bytes];
    //    }
    //    else if(bytes >= 1024 && bytes < 1024 * 1024)    // KB
    //    {
    //        return [NSString stringWithFormat:@"%.1fKB", (double)bytes / 1024];
    //    }
    //    else if(bytes >= 1024 * 1024 && bytes < 1024 * 1024 * 1024)    // MB
    //    {
    //        return [NSString stringWithFormat:@"%.2fMB", (double)bytes / (1024 * 1024)];
    //    }
    //    else    // GB
    //    {
    //        return [NSString stringWithFormat:@"%.3fGB", (double)bytes / (1024 * 1024 * 1024)];
    //    }
}
- (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    //    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         //筛选出IP地址格式
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}
//  判断是不是ip地址格式
- (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            //            NSRange resultRange = [firstMatch rangeAtIndex:0];
            //            NSString *result=[ipAddress substringWithRange:resultRange];
            
            //            NSLog(@"result==%@",result);
            return YES;
        }
    }
    return NO;
}
- (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
