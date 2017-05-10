//
//  ViewController.h
//  iOS传值
//
//  Created by yosemite on 16/9/14.
//  Copyright © 2016年 organization. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
@property (nonatomic,copy)NSString *value1;
+(instancetype)shareInstance;
@end

