//
//  WallpapersViewCell.m
//  UICollectionView 瀑布流
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "WallpapersViewCell.h"
#import "UIImageView+WebCache.h"
@interface WallpapersViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation WallpapersViewCell
-(void)setWallpapersModel:(WallpapersModel *)wallpapersModel
{
    _wallpapersModel=wallpapersModel;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:wallpapersModel.thumbUrl]];
    _titleLabel.text=wallpapersModel.name;

}
- (void)awakeFromNib {
    // Initialization code
}

@end
