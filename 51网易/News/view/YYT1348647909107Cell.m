//
//  YYT1348647909107Cell.m
//  51网易
//
//  Created by YY on 16/4/25.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYT1348647909107Cell.h"
#import "YYT1348647909107.h"
#import "UIImageView+WebCache.h"
#define kMargin 10
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface YYT1348647909107Cell ()
@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,weak)UIImageView *iconView;

@property (nonatomic,weak)UILabel *titleLabel;

@property (nonatomic,weak)UILabel *contentLabel;


@end


@implementation YYT1348647909107Cell
//+(instancetype)cellWtihTableView:(UITableView *)tableView
//{
//    
// static NSString *ID=@"id";
//    YYT1348647909107Cell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell=[[YYT1348647909107Cell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
////        [cell addSubviews];
//    }
//    return cell;
//}
-(void)layoutSubviews
{

}
-(void)setNeedsDisplay
{

}
-(void)setNeedsLayout
{

}

-(void)setNeedsUpdateConstraints
{

}
-(void)setNeedsFocusUpdate
{
    
}
-(void)setNeedsDisplayInRect:(CGRect)rect
{

}
-(void)sizeToFit
{

}
-(CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(1, 1);
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubviews];
        
    }
    return self;
}
-(void)addSubviews
{
//
    
    UIImageView *iconView=[[UIImageView alloc]initWithFrame:CGRectMake(kMargin, kMargin, 100, 80)];
    
    [self addSubview:iconView];
   
    _iconView=iconView;
    
    CGFloat labelX=CGRectGetMaxX(iconView.frame)+kMargin;
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(labelX, kMargin, kScreenW, 20)];
    titleLabel.font=[UIFont systemFontOfSize:17];
    [self addSubview:titleLabel];
    _titleLabel=titleLabel;
    
    UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(labelX, 2*kMargin+20, kScreenW-2*kMargin-100, 40)];
    contentLabel.font=[UIFont systemFontOfSize:13];
    contentLabel.textColor=[UIColor lightGrayColor];
    contentLabel.numberOfLines=0;
    [self addSubview:contentLabel];
    _contentLabel=contentLabel;
    
    
}

-(void)setT1348647909107:(YYT1348647909107 *)T1348647909107
{
    _T1348647909107=T1348647909107;
    _titleLabel.text=_T1348647909107.title;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:T1348647909107.imgsrc]];
    _contentLabel.text=_T1348647909107.digest;

}








@end
