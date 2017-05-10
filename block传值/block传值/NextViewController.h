//
//  NextViewController.h
//  block传值
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myBlock)(NSString *title);
@interface NextViewController : UIViewController
@property (nonatomic,copy)myBlock block;



@end
