//
//  ViewController.m
//  获取设备上所有app
//
//  Created by YY on 2016/12/27.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>
//  获取当前设备内存，磁盘的所需头文件
#import <sys/param.h>
#import <sys/mount.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

//     获取运营商的信息
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    获取设备上的app
    Class LSApplicationWorkspace_class =     objc_getClass("LSApplicationWorkspace");
    NSObject *workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray *apps = [workspace performSelector:@selector(allInstalledApplications)];
    NSLog(@"----apps: %@----", apps);
    
    
//    获取设备的运营商
    CTTelephonyNetworkInfo *info=[[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier=[info subscriberCellularProvider];
    NSLog(@"++++%@++++",[carrier carrierName]);//打印中国联通
    
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf)>=0) {
        freeSpace=(unsigned long long)(buf.f_bsize*buf.f_bavail);
    }
    NSLog(@"++++++%llu+++++",freeSpace);
    
//      获取当前设备总内存
    NSLog(@"~~~~~%llu~~~~~",[NSProcessInfo processInfo].physicalMemory);
    
    
    
    
//    获取当前设备可用内存
    NSLog(@"---------%f--------",[ViewController availableMemory]);
    
}
+(double)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount=HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    return (vm_page_size*vmStats.free_count);
}
-(void)defaultWorkspace{

}
-(void)allInstalledApplications{

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
