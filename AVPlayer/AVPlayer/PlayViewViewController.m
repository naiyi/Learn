//
//  PlayViewViewController.m
//  AVPlayer
//
//  Created by yosemite on 16/10/19.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "PlayViewViewController.h"
#import "PlayView.h"
#import <AVFoundation/AVFoundation.h>
@interface PlayViewViewController ()
{
    AVPlayerItem *_playerItem;
    AVPlayer *_player;
    AVPlayerLayer *_playerLayer;
    BOOL isPlaying;
    UIButton *_startOrPause;
}
//@property (nonatomic,strong)PlayView *playView;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)dispatch_source_t timer;
@property (nonatomic,strong)UILabel *currentTimeLabel;
@property (nonatomic,strong)UILabel *totalTimeLabel;
@property (nonatomic,strong)UIButton *fastBtn;

@end

@implementation PlayViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"22" ofType:@"mov"];
    _playerItem=[AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:filePath]];
    _player=[AVPlayer playerWithPlayerItem:_playerItem];
    _playerLayer=[AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame=CGRectMake(50, 50, self.view.frame.size.width-100, 300);
    _playerLayer.backgroundColor=[UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_playerLayer];
    
    _startOrPause=[UIButton buttonWithType:UIButtonTypeCustom];
    _startOrPause.frame=CGRectMake(10, 370, 50, 20);
    [_startOrPause setTitle:@"开始" forState:UIControlStateNormal];
    _startOrPause.backgroundColor=[UIColor redColor];
    [_startOrPause addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_startOrPause];
    
    self.slider=[[UISlider alloc]initWithFrame:CGRectMake(70, 376, self.view.frame.size.width-140, 4)];
    self.slider.tintColor=[UIColor greenColor];
    self.slider.thumbTintColor=[UIColor cyanColor];
    
    [self.slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    self.currentTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, 385, 80, 20)];
    self.currentTimeLabel.text=[NSString stringWithFormat:@"00:00"];
    self.currentTimeLabel.textColor=[UIColor greenColor];
    [self.view addSubview:self.currentTimeLabel];
    
    self.fastBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.fastBtn.frame=CGRectMake(self.view.frame.size.width-60, 370, 50, 20);
    [self.fastBtn setTitle:@"快进" forState:UIControlStateNormal];
    self.fastBtn.backgroundColor=[UIColor redColor];
    [self.fastBtn addTarget:self action:@selector(fastBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.fastBtn];
//    kvo键值观察
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    
   
}
-(void)fastBtnClicked
{
    CGFloat currentTime = _player.currentTime.value / _player.currentTime.timescale;
    
    // 总时间是播放资源的属性
    CGFloat duration = _playerItem.duration.value / _playerItem.duration.timescale;
    
    currentTime += 5;
    
    
    
    if (currentTime > duration) {
        currentTime = duration;
        [_player seekToTime:CMTimeMake(0, 1)];
    } else {
        // 跳转到 +30s后的时间
        [_player seekToTime:CMTimeMake(currentTime, 1)];
        
    }

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isKindOfClass:[AVPlayerItem class]]) {
        if ([keyPath isEqualToString:@"status"]) {
            if (AVPlayerStatusReadyToPlay==[change[@"new"] integerValue]) {
                
                 CGFloat totalTime=_playerItem.duration.value/_playerItem.duration.timescale;
                
                __weak typeof(self) WeakSelf=self;
                [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 10) queue:nil usingBlock:^(CMTime time) {
                    CGFloat currentTime=time.value/time.timescale;
                    
                   WeakSelf.currentTimeLabel.text=[NSString stringWithFormat:@"%02d:%02d", (int)currentTime / 60, (int)currentTime%60];
                    WeakSelf.slider.value=currentTime/totalTime;
                }];
            }
        }
    }
}
#pragma mark ----开始或暂停按钮-----
-(void)btnClicked
{
    
    isPlaying=!isPlaying;
    if (isPlaying) {
        [_startOrPause setTitle:@"暂停" forState:UIControlStateNormal];
        [_player play];
    }else
    {
        [_startOrPause setTitle:@"开始" forState:UIControlStateNormal];
        [_player pause];
    }
    
}
#pragma mark  ----进度条-----
-(void)sliderChanged:(UISlider*)slider
{
    NSLog(@"++++++++++");
    CGFloat durtion=_playerItem.duration.value/_playerItem.duration.timescale;
    CGFloat currentTime=durtion*slider.value;
    if (currentTime==durtion) {
        [_player seekToTime:CMTimeMake(0, 1)];
    }else
    {
        [_player seekToTime:CMTimeMake(currentTime, 1)];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
