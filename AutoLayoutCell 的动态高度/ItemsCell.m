//
//  ItemsCell.m
//  AutoLayoutCell 的动态高度
//
//  Created by YY on 16/5/20.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ItemsCell.h"
@interface ItemsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation ItemsCell
-(void)setModel:(ItemsModel *)model
{
    _model=model;
    _titleLabel.text=model.user[@"login"];
    _contentLabel.text=model.content;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
