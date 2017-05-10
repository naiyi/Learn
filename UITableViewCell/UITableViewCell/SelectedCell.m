//
//  SelectedCell.m
//  UITableViewCell
//
//  Created by yosemite on 16/9/22.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "SelectedCell.h"

@implementation SelectedCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _paytypeImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        [self addSubview:_paytypeImage];
        _labelText=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, self.frame.size.width-100, 40)];
        [self addSubview:_labelText];
        _selectedImage=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-50, 10, 30, 30)];
        
        [self addSubview:_selectedImage];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
