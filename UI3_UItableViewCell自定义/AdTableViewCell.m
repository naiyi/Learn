//
//  AdTableViewCell.m
//  UI3_UItableViewCell自定义
//
//  Created by zhangxueming on 16/3/17.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "AdTableViewCell.h"

@interface AdTableViewCell () <UIScrollViewDelegate>
{
    UIScrollView *_bgScrollView;
    UIView *_bgView;
    UILabel *_titleLabel;
    UIPageControl *_pageControl;
}


@end

@implementation AdTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _bgScrollView.delegate = self;
        _bgView = [[UIView alloc] initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor lightGrayColor];
        _titleLabel = [[UILabel alloc] init];
        [_bgView addSubview:_titleLabel];
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        [_bgView addSubview:_pageControl];
        
        [self.contentView addSubview:_bgScrollView];
        [self.contentView addSubview:_bgView];
    }
    return self;
}

- (void)setDataArray:(NSArray<AdModel *> *)dataArray
{
    _dataArray = dataArray;
    
    //NSLog(@"width = %.2f heigth = %.2f", self.frame.size.width, self.frame.size.height);
    _bgScrollView.frame = CGRectMake(0, 0, 414, 150);
    for (NSInteger i=0; i<dataArray.count; i++) {
        AdModel *model = (AdModel *)dataArray[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(414*i, 0, 414, 150)];
        imageView.image = [UIImage imageNamed:model.picName];
        [_bgScrollView addSubview:imageView];
    }
    
    _bgScrollView.contentSize = CGSizeMake(414*dataArray.count, 0);
    _bgScrollView.pagingEnabled = YES;
    
    _bgView.frame = CGRectMake(0, 120, 414, 30);
    _titleLabel.frame = CGRectMake(10, 0, 150, 30);
    _titleLabel.text = ((AdModel *)dataArray[0]).title;
    _pageControl.frame = CGRectMake(200, 10, 100, 20);
    _pageControl.numberOfPages = dataArray.count;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/414;
    AdModel *model = self.dataArray[index];
    _titleLabel.text = model.title;
    _pageControl.currentPage = index;
}


- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    //NSLog(@"width = %.2f heigth = %.2f", self.frame.size.width, self.frame.size.height);
}

@end
