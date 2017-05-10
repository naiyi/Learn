//
//  YYNewsController.h
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYNewsController : UITableViewController
@property(nonatomic,assign)NSArray *ShowPagesClassNameArray;

@property(nonatomic,assign)NSArray *arrayTittles;

- (void)addPortData;
@end
