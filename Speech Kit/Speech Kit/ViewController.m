//
//  ViewController.m
//  Speech Kit
//
//  Created by YY on 16/10/26.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <Speech/Speech.h>
@interface ViewController ()<SFSpeechRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SFSpeechRecognizer *sfspeech=[[SFSpeechRecognizer alloc]initWithLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en-US"]];
    sfspeech.delegate=self;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
