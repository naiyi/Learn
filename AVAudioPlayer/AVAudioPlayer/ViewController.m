//
//  ViewController.m
//  AVAudioPlayer
//
//  Created by yosemite on 16/10/17.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *_player;
    UIButton *_btn;
    UISlider *_slider;
    UIProgressView *_progressView;
}
@property (nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor whiteColor];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"11" ofType:@"mp3"];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    _player=[[AVAudioPlayer alloc]initWithData:data error:nil];
    _btn=[UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame=CGRectMake(100, 100, 100, 30);
//    AVAudioSession
//    AVCaptureSession
    
    [_btn setTitle:@"开始播放" forState:UIControlStateNormal];
    _btn.backgroundColor=[UIColor redColor];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _slider=[[UISlider alloc]initWithFrame:CGRectMake(100, 150, 200, 3)];
//    _slider.value=0;
//    _slider.minimumValue=0;
//    _slider.maximumValue=10;
    [_slider addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    UIButton *fastBtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 70, 100, 30)];
    fastBtn.backgroundColor=[UIColor cyanColor];
    [fastBtn setTitle:@"快进" forState:UIControlStateNormal];
    [fastBtn addTarget:self action:@selector(fastBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fastBtn];
    
    UIButton *lowBtn=[[UIButton alloc]initWithFrame:CGRectMake(220, 70, 100, 30)];
    lowBtn.backgroundColor=[UIColor cyanColor];
    [lowBtn setTitle:@"快退" forState:UIControlStateNormal];
    [lowBtn addTarget:self action:@selector(lowBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lowBtn];
    
    _progressView=[[UIProgressView alloc]initWithFrame:CGRectMake(100, 280, 200, 3)];
    _progressView.tintColor=[UIColor redColor];
    _progressView.trackTintColor=[UIColor greenColor];
    
    
    [self.view addSubview:_progressView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 330, 100, 40)];
    
    [self.view addSubview:label];
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,dispatch_get_main_queue());
    
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        _slider.value=_player.currentTime/_player.duration;
        int currentTime=(int)[_player currentTime];
        int min=currentTime/60;
        int second=currentTime%60;
        label.text=[NSString stringWithFormat:@"%i:%i",min,second];
       
    });
    dispatch_resume(self.timer);
    
    
   
    
}

-(void)lowBtnClicked
{
    _player.currentTime-=5;
}
-(void)fastBtnClicked
{
    _player.currentTime+=5;
}

-(void)valueChange
{
    _player.currentTime=_slider.value*_player.duration;

}


-(void)btnClicked:(UIButton *)btn
{
    if (_player.playing) {
        [_player pause];
        [_btn setTitle:@" 开始播放" forState:UIControlStateNormal];
    }else
    {
        [_player prepareToPlay];// 准备播放
        [_player play];
        [_btn setTitle:@"暂停播放" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
