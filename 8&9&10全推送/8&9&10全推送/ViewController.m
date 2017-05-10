//
//  ViewController.m
//  8&9&10全推送
//
//  Created by YY on 2017/3/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UILocalNotification *localNotification=[[UILocalNotification alloc] init];
    localNotification.fireDate=[NSDate dateWithTimeIntervalSinceNow:8];
    localNotification.alertBody=@"这是一个本地通知内容" ;
    localNotification.alertTitle=@"通知标题";
    localNotification.alertAction=@"赶紧";
    localNotification.hasAction=YES;
    localNotification.alertLaunchImage=@"111";
    localNotification.soundName=UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber=1;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
