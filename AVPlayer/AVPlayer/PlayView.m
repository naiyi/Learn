//
//  PlayView.m
//  AVPlayer
//
//  Created by yosemite on 16/10/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView
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

@end
