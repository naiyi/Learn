//
//  SnapWiFiSDK.m
//  SnapWiFi_SDK
//
//  Created by YY on 2017/4/11.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "SnapWiFiSDK.h"
#import "sys/utsname.h"
#import "YYHttpRequest.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "AFNetworking.h"
#import "ApplicationRuntime.h"
#import "STDPingServices.h"

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "SecurityUtil.h"

@interface SnapWiFiSDK()

@property (nonatomic,strong)dispatch_source_t timer1;

@property (nonatomic,strong)STDPingServices *services;

@property (nonatomic,strong)NSString *currentTraffic;

@property (nonatomic,strong)dispatch_source_t timer2;

@property (nonatomic,copy)calculateExchangeData exchangeData;
@end

SnapWiFiSDK *_snapwifi;
@implementation SnapWiFiSDK
+(instancetype)shareWiFiInfo{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _snapwifi=[[SnapWiFiSDK alloc] init];
    });
    return _snapwifi;
}


-(void)getWiFiHotInformation:(NSDictionary*)parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError * error))failure{
    NSString *filePath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fileName=[filePath stringByAppendingPathComponent:@"test.plist"];
    [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryHotsList" parameters:parameters progress:^(NSProgress *uploadProgress) {
        
    } success:^(id responseObject) {
        [[NSFileManager defaultManager] createFileAtPath:fileName contents:responseObject attributes:nil];
        success([NSData dataWithContentsOfFile:fileName options:0 error:NULL]);
    } failure:^(NSError *error) {
//        failure(error);
        success([NSData dataWithContentsOfFile:fileName options:0 error:NULL]);
    }];
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSDate *now = [NSDate date];
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        [formatter1 setDateStyle:NSDateFormatterMediumStyle];
        [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *dateStr1 = [formatter1 stringFromDate:now];
        NSArray *array=[dateStr1 componentsSeparatedByString:@" "];
        NSArray *array1=[[array objectAtIndex:1] componentsSeparatedByString:@":"];
        if ([[array1 objectAtIndex:0] intValue]==3) {

            [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryHotsList" parameters:parameters progress:^(NSProgress *uploadProgress) {
                
            } success:^(id responseObject) {
                [[NSFileManager defaultManager] createFileAtPath:fileName contents:responseObject attributes:nil];
                success([NSData dataWithContentsOfFile:fileName options:0 error:NULL]);
            } failure:^(NSError *error) {
                failure(error);
                success([NSData dataWithContentsOfFile:fileName options:0 error:NULL]);
            }];
        }
    });
    dispatch_resume(timer);
    self.timer1=timer;
    
}

-(void)uploadCollectionOfUserInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure{
    [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_uploadHotspotUser" parameters:parameters progress:^(NSProgress *uploadProgress) {
        
    } success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
-(void)queryConfigurationInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure
{
    [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryMerchantsConfig" parameters:parameters progress:^(NSProgress *uploadProgress) {
    } success:^(id responseObject) {

        
        success(responseObject);
    } failure:^(NSError *error) {
//        failure(error);

        
    }];
}


-(void)updateCollectionInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure
{
    [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_updateHotspotUser" parameters:parameters progress:^(NSProgress *uploadProgress) {
        
    } success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(NSString *)decryptAESString:(NSString *)string{
   return [SecurityUtil decryptAESData:string];
}

-(NSString *)currentBssid{
    NSString *bssid = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info[@"BSSID"]) {
            bssid = info[@"BSSID"];
        }
    }
    return bssid;
}
-(NSString *)currentSsid{
    NSString *ssid = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info[@"SSID"]) {
            ssid = info[@"SSID"];
        }
    }
    return ssid;
}

-(NSString *)sysversion{
    return [[UIDevice currentDevice] systemVersion];
}


-(NSString *)deviceName
{
    return [self getDeviceName];
}
-(NSString *)deviceNumber{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

-(void)registerSDKServiceWithKey:(NSString *)appkey{
    
    [YYHttpRequest POST:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryMerchantsConfig" parameters:@{@"appkey":appkey} progress:^(NSProgress *uploadProgress) {
    } success:^(id responseObject) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:dict forKey:@"configurationInfo"];
        
        [[ApplicationRuntime currentRuntime] setPingUrlStr:[[dict objectForKey:@"object"] objectForKey:@"pingUrl"]];
        
        
    } failure:^(NSError *error) {
       
        
        
    }];
    
        AFNetworkReachabilityManager *manager= [AFNetworkReachabilityManager sharedManager];
        [manager startMonitoring];
        
//        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            switch (status) {
//                case AFNetworkReachabilityStatusUnknown:
//                {
//                    NSLog(@"网络未知");
//                    [[ApplicationRuntime currentRuntime] setCurrentData:[[NSDate date] timeIntervalSince1970]];
//                }
//                    break;
//                case AFNetworkReachabilityStatusNotReachable:
//                {
//                    
//                    
//                    NSLog(@"网络不可达--%f",[[ApplicationRuntime currentRuntime] connectedData]);
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                {
//                    NSLog(@"蜂窝数据");
//                    
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWiFi:{
//                    NSLog(@"wifi");
//                    [[ApplicationRuntime currentRuntime]setConnectedData:[self getGprsWifiFlowIOBytes]];
//                    
//                    
//                }
//                    break;
//                default:
//                    break;
//                    
//            }
//        }];

    
}

-(void)calculatePingValue:(calculatePingValue)pingvalue{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dict=[defaults objectForKey:@"configurationInfo"];
  

         __block double pingVue=0;
        self.services=[STDPingServices startPingAddress:[[dict objectForKey:@"object"] objectForKey:@"pingUrl"] callbackHandler:^(STDPingItem *pingItem, NSArray *pingItems) {
            if (pingItems.count==9) {
                double pingValue=0;
                for (STDPingItem *item in pingItems) {
                    pingValue+=item.timeMilliseconds;
                }
                pingVue=pingValue/10;
                if (pingvalue) {
                    pingvalue([NSString stringWithFormat:@"%f",pingVue]);
                }
                
            }
        }];
    
    
}
-(NSString *)macAdress{
    return [self macAdress];
}
- (NSString *) macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //    NSLog(@"outString:%@", outstring);
    
    free(buf);
    
    return [outstring uppercaseString];
}


-(void)calculateExchangeData:(calculateExchangeData)calculateData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.00001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    
                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
                    if (exchangeData<0) {
                        exchangeData=0;
                    }
                    if (calculateData) {
                        calculateData(exchangeData);
                    }
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                {
                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];

                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
                    if (exchangeData<0) {
                        exchangeData=0;
                    }
                    if (calculateData) {
                        calculateData(exchangeData);
                    }
                }
                case AFNetworkReachabilityStatusUnknown:{
                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
                    if (exchangeData<0) {
                        exchangeData=0;
                    }
                    if (calculateData) {
                        calculateData(exchangeData);
                    }
                }
                case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
                    
                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
                    if (exchangeData<0) {
                        exchangeData=0;
                    }
                    if (calculateData) {
                        calculateData(exchangeData);
                    }
                }
                default:
                    break;
            }
        }];
    });
    
}

-(void)calculateData:(calculatePingvalueAndConnectDateAndExchangeData)callBack{
    

    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
    });
    dispatch_resume(timer);
    self.timer2=timer;
//        AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
//        [manager startMonitoring];
//        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            switch (status) {
//                case AFNetworkReachabilityStatusReachableViaWiFi:
//                {
//                    
//                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
//                    [[ApplicationRuntime currentRuntime] setConncetedTime:[[NSDate date] timeIntervalSince1970]];
//                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
//                    if (exchangeData<0) {
//                        exchangeData=0;
//                    }
//                    if (callBack) {
//                        callBack([[ApplicationRuntime currentRuntime] conncetedTime],exchangeData,[[ApplicationRuntime currentRuntime] breakTime]);
//                    }
//                }
//                    break;
//                case AFNetworkReachabilityStatusNotReachable:
//                {
//                    [[ApplicationRuntime currentRuntime] setBreakTime:[[NSDate date] timeIntervalSince1970]];
//                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
//                    
//                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
//                    if (exchangeData<0) {
//                        exchangeData=0;
//                    }
//                    if (callBack) {
//                        callBack([[ApplicationRuntime currentRuntime] conncetedTime],exchangeData,[[ApplicationRuntime currentRuntime] breakTime]);
//                    }
//                }
//                case AFNetworkReachabilityStatusUnknown:{
//                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
//                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
//                    if (exchangeData<0) {
//                        exchangeData=0;
//                    }
//                    if (callBack) {
//                        callBack([[ApplicationRuntime currentRuntime] conncetedTime],exchangeData,[[ApplicationRuntime currentRuntime] breakTime]);
//                    }
//                }
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                {
//                    [[ApplicationRuntime currentRuntime]setCurrentData:[self getGprsWifiFlowIOBytes]];
//                    
//                    double exchangeData=[[ApplicationRuntime currentRuntime] currentData]-[[ApplicationRuntime currentRuntime] connectedData];
//                    if (exchangeData<0) {
//                        exchangeData=0;
//                    }
//                    if (callBack) {
//                        callBack([[ApplicationRuntime currentRuntime] conncetedTime],exchangeData,[[ApplicationRuntime currentRuntime] breakTime]);
//                    }
//                }
//                default:
//                    break;
//            }
//        }];
//    });
}
-(NSString *)ipAddress{
    return [self getIPAddress:YES];
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
-(NSString *)country{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

-(NSString *)language{
    //    [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]  objectAtIndex:0];
}

-(NSTimeInterval)connectedDate{
    return [[ApplicationRuntime currentRuntime] conncetedTime];
}

-(NSTimeInterval)breakedDate{
    
    return [[ApplicationRuntime currentRuntime] breakTime];
}

- (NSString *)getDeviceName
{
    // 需要
    //#warning 题主呕心沥血总结！！最全面！亲测！全网独此一份！！
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}

@end
