//
//  AlertView.h
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AlertView : NSObject

+(instancetype)sigle;

-(void)titleArray:(NSArray *)titleArr leftImg:(UIImage *)leftImg rightImg:(UIImage *)rightImg;


@end
