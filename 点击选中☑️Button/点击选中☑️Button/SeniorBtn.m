//
//  SeniorBtn.m
//  点击选中☑️Button
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "SeniorBtn.h"
#define MainScreeenW [UIScreen mainScreen].bounds.size.width
@interface SeniorBtn()

@property (nonatomic,strong)UIImageView *iconImage;
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;

@end
@implementation SeniorBtn

-(instancetype)initWithFrame:(CGRect)frame :(NSString *)payment :(NSString *)detail :(NSString *)iconImage
{
    if (self=[super initWithFrame:frame]) {
        _iconImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        _iconImage.image=[UIImage imageNamed:iconImage];
        [self addSubview:_iconImage];
        _label1=[[UILabel alloc]initWithFrame:CGRectMake(70, 5, MainScreeenW-150, 25)];
        _label1.text=payment;
        [self addSubview:_label1];
        _label2=[[UILabel alloc]initWithFrame:CGRectMake(70,30 ,MainScreeenW-150, 20)];
        _label2.text=detail;
        [self addSubview:_label2];
        _selectImage=[[UIImageView alloc]initWithFrame:CGRectMake(MainScreeenW-70, 10, 40, 40)];
        [self addSubview:_selectImage];
       
    }
    
    return self;
}

@end
