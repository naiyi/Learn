//
//  PAdvertiseView.h
//  广告启动页
//
//  Created by DFSJ on 17/2/9.
//  Copyright © 2017年 Oriental Horizon. All rights reserved.
//

#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height




#import <UIKit/UIKit.h>
typedef void (^PushToAdBlock)();

@interface PAdvertiseView : UIView

@property (nonatomic, strong) UIImageView *adView;
/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@property (nonatomic,copy) PushToAdBlock pushToAdBlock;
/** 显示广告页面方法*/
- (void)show;

-(void) TouchPushToAdBlock:(PushToAdBlock)pushToAdBlock;


@end
