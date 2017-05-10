//
//  MyBarCodeController.h
//  BeYou
//
//  Created by qingshan on 16/4/26.
//  Copyright © 2016年 HQS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MyBarCodeControllerPageTypeNone,    //无
    MyBarCodeControllerPageTypeScan,    //扫一扫
    MyBarCodeControllerPageTypeBind     //绑卡
} MyBarCodeControllerPageType;

@interface MyBarCodeController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *scanBgImage;
@property (strong, nonatomic) IBOutlet UIImageView *scanLineImage;
@property (strong, nonatomic) IBOutlet UIButton *flashButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lineTop;

@property (nonatomic,assign) MyBarCodeControllerPageType pageType;

@end
