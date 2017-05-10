//
//  UIBarButtonItem+YYBarButtonItem.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "UIBarButtonItem+YYBarButtonItem.h"

@implementation UIBarButtonItem (YYBarButtonItem)
+(UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlevents
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlevents];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
+(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
