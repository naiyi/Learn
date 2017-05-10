//
//  NextViewController.h
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
//协议
@protocol NextViewControllerDelegate <NSObject>
//必须实现的方法
-(void)PassTextValue:(NSString *)tfText;

@end


@interface NextViewController : UIViewController
//  代理传值
@property (nonatomic,assign)id<NextViewControllerDelegate>delegate;

//  block传值
@property (nonatomic,assign)void (^NextVCBlock)(NSString *tfText);
@end
