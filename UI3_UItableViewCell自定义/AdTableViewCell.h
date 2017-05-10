//
//  AdTableViewCell.h
//  UI3_UItableViewCell自定义
//
//  Created by zhangxueming on 16/3/17.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdModel.h"

@interface AdTableViewCell : UITableViewCell

@property (nonatomic,retain) NSArray <AdModel *>*dataArray;

@end
