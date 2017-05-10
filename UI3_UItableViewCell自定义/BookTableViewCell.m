//
//  BookTableViewCell.m
//  UI3_UItableViewCell自定义
//
//  Created by zhangxueming on 16/3/17.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "BookTableViewCell.h"

@interface BookTableViewCell ()

{

}
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@end


@implementation BookTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self.contentView addSubview:self.icon];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 200, 20)];
        [self.contentView addSubview:self.titleLabel];
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 200, 20)];
        [self.contentView addSubview:self.detailLabel];

        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 200, 20)];
        [self.contentView addSubview:self.priceLabel];


        
    }
    return self;
}

//- (UIImageView *)icon
//{
//    if (!_icon) {
//        _icon = [[UIImageView alloc] init];
//    }
//    return _icon;
//}

//- (UILabel *)titleLabel
//{
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc] init];
//    }
//    return _titleLabel;
//}
//
//- (UILabel *)priceLabel
//{
//    if (!_priceLabel) {
//        _priceLabel = [[UILabel alloc] init];
//    }
//    return _priceLabel;
//}
//
//- (UILabel *)detailLabel
//{
//    if (!_detailLabel) {
//        _detailLabel = [[UILabel alloc] init];
//    }
//    return _detailLabel;
//}

- (void)setDataModel:(BookModel *)dataModel
{
    _dataModel = dataModel;
    self.icon.image = [UIImage imageNamed:dataModel.icon];
    self.titleLabel.text = dataModel.title;
    self.priceLabel.text = dataModel.price;
    self.detailLabel.text = dataModel.detail;
    
//    self.icon.frame = CGRectMake(10, 10, 80, 80);
//    self.titleLabel.frame = CGRectMake(100, 10, 200, 20);
//    self.priceLabel.frame = CGRectMake(100, 40, 200, 20);
//    self.detailLabel.frame = CGRectMake(100, 70, 200, 20);
//    [self.contentView addSubview:self.icon];
//    [self.contentView addSubview:self.titleLabel];
//    [self.contentView addSubview:self.detailLabel];
//    [self.contentView addSubview:self.priceLabel];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
