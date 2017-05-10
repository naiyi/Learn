//
//  YYTableViewCell.m
//  TestOne
//
//  Created by YY on 2017/5/5.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYTableViewCell.h"
@interface YYTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *labelText;

@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightImg;

@end
@implementation YYTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"id";
    
    YYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell addSubviews];
    }
    
    return cell;
}
- (void)addSubviews {
    self.labelText.text=@"1234";
    [self addSubview:self.labelText];
    self.leftImg.image=[UIImage imageNamed:@"leftImg"];
    [self addSubview:self.leftImg];
    self.rightImg.image=[UIImage imageNamed:@"rightimg"];
    [self addSubview:self.rightImg];
    
}

@end
