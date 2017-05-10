//
//  YYReaderCell.m
//  51网易
//
//  Created by YY on 16/5/4.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYReaderCell.h"
#import "YYReaderModel.h"
#import "UIImageView+WebCache.h"
#import "PrefixHeader.pch"
#define kMargin 10
@interface YYReaderCell ()
@property (nonatomic,weak)UIImageView *iconImage;
@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UILabel *sourceLabel;


@end
@implementation YYReaderCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addSubviews];
    }
    return self;
}
-(void)addSubviews
{
    UIImageView *iconView=[[UIImageView alloc]initWithFrame:CGRectMake(kMargin, kMargin, 90, 90)];
    [self addSubview:iconView];
    _iconImage=iconView;
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(kMargin+CGRectGetMaxX(iconView.frame),kMargin, MainScreenW-2*kMargin-CGRectGetMaxX(iconView.frame), 40)];
    titleLabel.numberOfLines=0;
    titleLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:titleLabel];
    _titleLabel=titleLabel;
    
    UILabel *sourceLabel=[[UILabel alloc]initWithFrame:CGRectMake(kMargin+CGRectGetMaxX(iconView.frame), kMargin+CGRectGetMaxY(titleLabel.frame), MainScreenW-90-2*kMargin, 40)];
    
    sourceLabel.font=[UIFont systemFontOfSize:16];
    [self addSubview:sourceLabel];
    _sourceLabel=sourceLabel;
    
    
}
-(void)setReaderModel:(YYReaderModel *)readerModel
{
    _readerModel=readerModel;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:readerModel.imgsrc]];
    _titleLabel.text=readerModel.title;
    _sourceLabel.text=readerModel.source;
   
}

@end
