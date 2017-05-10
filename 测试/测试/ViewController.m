//
//  ViewController.m
//  测试
//
//  Created by yosemite on 16/10/18.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "PlayView.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{
    AVPlayer *_player;
    AVPlayerItem *_playerItem;
    AVPlayerLayer *_playerLayer;

}
//@property (nonatomic,strong)PlayView *playview;
@property (nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"22" withExtension:@"mov"];
    _playerItem=[AVPlayerItem playerItemWithURL:url];
    _player=[AVPlayer playerWithPlayerItem:_playerItem];
    
    
    _playerLayer=[AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame=CGRectMake(20, 100, self.view.frame.size.width-40, 250);
    _playerLayer.backgroundColor=[UIColor cyanColor].CGColor;
    
    [self.view.layer addSublayer:_playerLayer];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(150, 330, self.view.frame.size.width-300, 40);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        
    });
    dispatch_resume(self.timer);
}

-(void)btnclicked
{
    [_player play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
