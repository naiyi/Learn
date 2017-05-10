//
//  CustomViewCell.m
//  UI1_数据库练习
//
//  Created by zhangxueming on 16/5/24.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "CustomViewCell.h"
#import "UserModel.h"
#import "ItemModel.h"
#import "DBManager.h"

@interface CustomViewCell ()<UIActionSheetDelegate>
{
    UIActionSheet *_sheet;
}
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end


@implementation CustomViewCell


- (void)setDataModel:(ItemModel *)dataModel
{
    _dataModel = dataModel;
    _userLabel.text = dataModel.login;
    _contentLabel.text =dataModel.content;
}

- (void)awakeFromNib {
    // Initialization code
    //_headImageView.userInteractionEnabled = NO;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClicked:)];
    [self addGestureRecognizer:longPress];
}

- (void)longPressClicked:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state ==UIGestureRecognizerStateBegan) {
        _sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"收藏" otherButtonTitles:nil];
        [_sheet showInView:[UIApplication sharedApplication].keyWindow];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index = %li", buttonIndex);
    if (buttonIndex==0) {
        //收藏或者取消收藏
        DBManager *manager = [DBManager sharedManager];
        BOOL ret = [manager isItemExist:self.dataModel];
        if (!ret) {
            //收藏
            [manager dbbaseInsertItem:self.dataModel];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
