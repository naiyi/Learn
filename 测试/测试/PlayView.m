//
//  PlayView.m
//  测试
//
//  Created by yosemite on 16/10/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "PlayView.h"
@interface PlayView()
@property (nonatomic,strong)UIButton *startBtn;
//@property (nonatomic,strong)UIButton *stopBtn;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)UIButton *fastBtn;
@property (nonatomic,strong)UIButton *lowBtn;

@end
@implementation PlayView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        [self layoutsubviews];
    }
    return self;
}

+(Class)layerClass
{
    return [AVPlayerLayer class];
}

-(void)setPlayer:(AVPlayer *)player
{
    _player=player;
    AVPlayerLayer *playerLayer=(AVPlayerLayer *)self.layer;
    playerLayer.player=player;
}
-(void)layoutsubviews
{

}
@end
