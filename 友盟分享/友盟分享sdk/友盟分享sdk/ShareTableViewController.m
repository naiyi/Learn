//
//  ShareTableViewController.m
//  友盟分享sdk
//
//  Created by yosemite on 16/9/28.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ShareTableViewController.h"
#import "UMSocialUIManager.h"
@interface ShareTableViewController ()
{
   
}
@property (nonatomic, assign) int mediastyle;
@end

@implementation ShareTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(150, 350, self.view.frame.size.width-300, 50);
    [btn setTitle:@"分享" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnClicked:(UIButton *)btn
{
    UMSocialManager *manager=[UMSocialManager defaultManager];
    UMSocialMessageObject *object=[UMSocialMessageObject messageObject];
    object.text=@"123456";
    [manager shareToPlatform:UMSocialPlatformType_WechatSession messageObject:object currentViewController:self completion:^(id result, NSError *error) {
        
    }];
    
}

@end
