//
//  YYPopView.h
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickedCallBack)(NSInteger index);
typedef void (^ClosedCallBack)();
@interface YYPopView : UIViewController
@property(nonatomic,copy)ClosedCallBack closeCallBack;
@property(nonatomic,copy)ClickedCallBack clickCallBack;


-(void)show;
@end
