//
//  YYYYT1348647909107CellTwo.m
//  51网易
//
//  Created by YY on 16/5/4.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYT1348647909107CellTwo.h"
#import "YYT1348647909107.h"
#import "UIImageView+WebCache.h"
#import "PrefixHeader.pch"
#define kMargin 10
@interface YYT1348647909107CellTwo ()
@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UIImageView *imageView1;
@property (nonatomic,weak)UIImageView *imageView2;
@property (nonatomic,weak)UIImageView *imageView3;


@end
@implementation YYT1348647909107CellTwo


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubViews];
    }
    return self;
}
-(void)addSubViews
{
    CGFloat kImageViewW=(MainScreenW-4*kMargin)/3;
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(kMargin, kMargin, MainScreenW, 30)];
    [self addSubview:titleLabel];
    _titleLabel=titleLabel;
    
    UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(kMargin, CGRectGetMaxY(titleLabel.frame)+kMargin, kImageViewW, 100)];
    [self addSubview:imageView1];
    _imageView1=imageView1;
    
    UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(kMargin+CGRectGetMaxX(imageView1.frame), CGRectGetMaxY(titleLabel.frame)+kMargin, kImageViewW, 100)];
    [self addSubview:imageView2];
    _imageView2=imageView2;
    
    UIImageView *imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(kMargin+CGRectGetMaxX(imageView2.frame), CGRectGetMaxY(titleLabel.frame)+kMargin, kImageViewW, 100)];
    [self addSubview:imageView3];
    _imageView3=imageView3;
}

-(void)setT1348647909107:(YYT1348647909107 *)T1348647909107
{
    _T1348647909107=T1348647909107;
    _titleLabel.text=T1348647909107.title;
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:T1348647909107.imgsrc]];
    
    NSString *imageUrl =[T1348647909107.imgextra[0] imgsrc];
    NSString *imageURL=[T1348647909107.imgextra[1] imgsrc];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    [_imageView3 sd_setImageWithURL:[NSURL URLWithString:imageURL]];
}

@end
