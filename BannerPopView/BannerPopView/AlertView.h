//
//  AlertView.h
//  BannerPopView
//
//  Created by YY on 2017/3/31.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertView : NSObject

+(instancetype)sigle;
-(void)titleArray:(NSArray *)titleArr;

-(void)show;
@end
