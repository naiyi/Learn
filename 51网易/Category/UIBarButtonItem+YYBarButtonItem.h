//
//  UIBarButtonItem+YYBarButtonItem.h
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YYBarButtonItem)
+(UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlevents;

+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
