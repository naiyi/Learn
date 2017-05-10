//
//  SeconViewController.h
//  iOS传值
//
//  Created by yosemite on 16/9/14.
//  Copyright © 2016年 organization. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PassTextDelegate <NSObject>

-(void)PassTextValue:(NSString *)text;

@end
typedef void(^passTextBlock)(NSString *);
@interface SeconViewController : UIViewController

@property (nonatomic,assign)id <PassTextDelegate> delegate;

@property (nonatomic,copy)passTextBlock textBlock;

-(void)returnText:(passTextBlock) block;

@end
