//
//  main.m
//  TingyunDemo
//
//  Created by NBS on 16/6/30.
//  Copyright © 2016年 TGF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [NBSAppAgent startWithAppID:@"8b50df3b6b3e4ae5819b33f4a9418135"];//设置成听云报表生成的appkey
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
