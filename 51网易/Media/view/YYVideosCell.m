//
//  YYVideosCell.m
//  51网易
//
//  Created by YY on 16/4/29.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYVideosCell.h"
#define kMargin 5
#import "YYVideoModel.h"
#import "UIImageView+WebCache.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface YYVideosCell ()
@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UIImageView *imageViews;
@property (nonatomic,weak)UIImageView *iconView;
@property (nonatomic,weak)UILabel *nameLabel;
@property (nonatomic,weak)UILabel *playCount;


@end
@implementation YYVideosCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
       
    }
    return self;
}
-(void)addSubviews
{
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(kMargin, kMargin, kScreenW-2*kMargin, 25)];
    titleLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:titleLabel];
    _titleLabel=titleLabel;
    
    UIImageView *imageViews=[[UIImageView alloc]initWithFrame:CGRectMake(2*kMargin, CGRectGetMaxY(_titleLabel.frame)+kMargin, kScreenW-4*kMargin,280)];
    [self addSubview:imageViews];
    _imageViews=imageViews; 
    
    UIImageView *iconView=[[UIImageView alloc]initWithFrame:CGRectMake(3*kMargin, CGRectGetMaxY(_imageViews.frame)+kMargin, 30, 30)];
    [self addSubview:iconView];
    _iconView=iconView;
    
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_iconView.frame)+30, CGRectGetMaxY(_imageViews.frame)+kMargin, 200, 35)];
    nameLabel.font=[UIFont systemFontOfSize:15];   
    [self addSubview:nameLabel];
    _nameLabel=nameLabel;
    
    

    
}
-(void)setVideoModel:(YYVideoModel *)videoModel
{
    _videoModel=videoModel;
    _titleLabel.text=_videoModel.title;
    
    [_imageViews sd_setImageWithURL:[NSURL URLWithString:videoModel.cover]];
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:videoModel.topicImg]];
    
    _nameLabel.text=_videoModel.topicName;
    
    

}


@end
