//
//  SeniorBtn.h
//  点击选中☑️Button
//
//  Created by yosemite on 16/9/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeniorBtn : UIControl
//@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,assign)NSInteger defaultIdx;
@property (nonatomic,assign)NSInteger currentIdx;
@property (nonatomic,assign)BOOL isSelect;
@property (nonatomic,strong)UIImageView *selectImage;
//-(instancetype )initWithFrame:(CGRect)rect :(UIImage *)icoImage :(NSString *)label1 :(NSString *)label2;

-(instancetype)initWithFrame:(CGRect)frame :(NSString *)payment :(NSString *)detail :(NSString *)iconImage;

@end
