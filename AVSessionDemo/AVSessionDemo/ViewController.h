//
//  ViewController.h
//  AVSessionDemo
//
//  Created by iHope on 13-11-11.
//  Copyright (c) 2013年 任海丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UIImageView *soundLodingImageView;
    IBOutlet UIButton *playBtn;
    
    //录音器
    AVAudioRecorder *recorder;
    //播放器
    AVAudioPlayer *player;
    NSDictionary *recorderSettingsDict;
    
    //定时器
    NSTimer *timer;
    //图片组
    NSMutableArray *volumImages;
    double lowPassResults;
    
    //录音名字
    NSString *playName;
    
}
- (IBAction)downAction:(id)sender;
- (IBAction)upAction:(id)sender;

- (IBAction)playAction:(id)sender;

@end
