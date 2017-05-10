//
//  ViewController.m
//  AVSessionDemo
//
//  Created by iHope on 13-11-11.
//  Copyright (c) 2013年 任海丽. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        //7.0第一次运行会提示，是否允许使用麦克风
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *sessionError;
        //AVAudioSessionCategoryPlayAndRecord用于录音和播放
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
        if(session == nil)
            NSLog(@"Error creating session: %@", [sessionError description]);
        else
            [session setActive:YES error:nil];
    }
    

    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    playName = [NSString stringWithFormat:@"%@/play.aac",docDir];
    //录音设置
    recorderSettingsDict =[[NSDictionary alloc] initWithObjectsAndKeys:
                                         [NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,
                                         [NSNumber numberWithInt:1000.0],AVSampleRateKey,
                                         [NSNumber numberWithInt:2],AVNumberOfChannelsKey,
                                         [NSNumber numberWithInt:8],AVLinearPCMBitDepthKey,
                                         [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,
                                         [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,
                                         nil];
    //音量图片数组
    volumImages = [[NSMutableArray alloc]initWithObjects:@"RecordingSignal001",@"RecordingSignal002",@"RecordingSignal003",
                   @"RecordingSignal004", @"RecordingSignal005",@"RecordingSignal006",
                   @"RecordingSignal007",@"RecordingSignal008",   nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downAction:(id)sender {
    //按下录音
    if ([self canRecord]) {

        NSError *error = nil;
        //必须真机上测试,模拟器上可能会崩溃
        recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:playName] settings:recorderSettingsDict error:&error];
        
        if (recorder) {
            recorder.meteringEnabled = YES;
            [recorder prepareToRecord];
            [recorder record];
            
            //启动定时器
            timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(levelTimer:) userInfo:nil repeats:YES];
            
        } else
        {
            int errorCode = CFSwapInt32HostToBig ([error code]);
            NSLog(@"Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode);
            
        }
    }
   
}

- (IBAction)upAction:(id)sender {
    //松开 结束录音
    
    //录音停止
    [recorder stop];
    recorder = nil;
    //结束定时器
    [timer invalidate];
    timer = nil;
    //图片重置
    soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:0]];
    
}

- (IBAction)playAction:(id)sender {
    
    NSError *playerError;
    
    //播放
    player = nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:playName] error:&playerError];
    
    if (player == nil)
    {
        NSLog(@"ERror creating player: %@", [playerError description]);
    }else{
        [player play];
    }
    
}

-(void)levelTimer:(NSTimer*)timer_
{
    //call to refresh meter values刷新平均和峰值功率,此计数是以对数刻度计量的,-160表示完全安静，0表示最大输入值
    [recorder updateMeters];
    const double ALPHA = 0.05;
	double peakPowerForChannel = pow(10, (0.05 * [recorder peakPowerForChannel:0]));
	lowPassResults = ALPHA * peakPowerForChannel + (1.0 - ALPHA) * lowPassResults;
    
	NSLog(@"Average input: %f Peak input: %f Low pass results: %f", [recorder averagePowerForChannel:0], [recorder peakPowerForChannel:0], lowPassResults);
    
    if (lowPassResults>=0.8) {
        
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:7]];
    }else if(lowPassResults>=0.7){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:6]];
    }else if(lowPassResults>=0.6){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:5]];
    }else if(lowPassResults>=0.5){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:4]];
    }else if(lowPassResults>=0.4){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:3]];
    }else if(lowPassResults>=0.3){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:2]];
    }else if(lowPassResults>=0.2){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:1]];
    }else if(lowPassResults>=0.1){
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:0]];
    }else{
        soundLodingImageView.image = [UIImage imageNamed:[volumImages objectAtIndex:0]];
    }

    
}

//判断是否允许使用麦克风7.0新增的方法requestRecordPermission
-(BOOL)canRecord
{
    __block BOOL bCanRecord = YES;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                if (granted) {
                    bCanRecord = YES;
                    
                    NSLog(@"ios10------------------1111111");
                }
                else {
                    
                    NSLog(@"ios10------------------222222");
                    bCanRecord = NO;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[[UIAlertView alloc] initWithTitle:nil
                                                    message:@"app需要访问您的麦克风。\n请启用麦克风-设置/隐私/麦克风"
                                                   delegate:nil
                                          cancelButtonTitle:@"关闭"
                                          otherButtonTitles:nil] show];
                    });
                }
            }];
        }
    }
    
    return bCanRecord;
}

@end
