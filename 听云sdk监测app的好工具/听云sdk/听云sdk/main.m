//
//  main.m
//  听云sdk
//
//  Created by yosemite on 16/9/27.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [NBSAppAgent startWithAppID:@"a61aa324b44c479cb5981d1cab7c891b"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
