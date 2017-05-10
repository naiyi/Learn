//
//  PopView.h
//  弹框
//
//  Created by YY on 2017/3/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CloseCallBack)();
typedef void(^ClickCallBack)();
@interface PopView : UIViewController

@property(nonatomic,copy)CloseCallBack closeCallBack;

@property(nonatomic,copy)ClickCallBack clickCallBack;


-(instancetype)initWithWithImage:(UIImage *)image clickCallBack:(ClickCallBack)clickCallBack andCloseCallBack:(CloseCallBack)closeCallBack;


-(void)show;

@end
