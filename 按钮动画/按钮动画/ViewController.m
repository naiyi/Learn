//
//  ViewController.m
//  按钮动画
//
//  Created by yosemite on 16/10/11.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *_upLabel;
    UILabel *_downLabel;
    UILabel *_leftLabel;
    UILabel *_rightLabel;
}
@property (nonatomic,assign)BOOL isShow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    _upLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 50, 50)];
    _upLabel.layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _upLabel.backgroundColor=[UIColor orangeColor];
    _upLabel.text=@"123";
    _upLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_upLabel];
    
    _downLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 50, 50)];
    _downLabel.layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _downLabel.backgroundColor=[UIColor orangeColor];
    _downLabel.text=@"345";
    _downLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_downLabel];
    _leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 50, 50)];
    _leftLabel.layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _leftLabel.text=@"456";
    _leftLabel.backgroundColor=[UIColor greenColor];
    _leftLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_leftLabel];
    _rightLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,50, 50)];
    _rightLabel.layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _rightLabel.textAlignment=NSTextAlignmentCenter;
    _rightLabel.text=@"678";
    _rightLabel.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_rightLabel];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 70, 70);
    btn.layer.cornerRadius=35;
    btn.layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    btn.backgroundColor=[UIColor cyanColor];
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.isShow=NO;
}
-(void)show
{
    [UIView animateWithDuration:2 animations:^{
        _upLabel.transform=CGAffineTransformMakeTranslation(0, -180);
        
        _downLabel.transform=CGAffineTransformMakeTranslation(0, +180);
       
        _leftLabel.transform=CGAffineTransformMakeTranslation(-150, 0);
        
        _rightLabel.transform=CGAffineTransformMakeTranslation(+150, 0);
        
    }];
}
-(void)noShow
{
    [UIView animateWithDuration:2 animations:^{
        _upLabel.transform=CGAffineTransformMakeTranslation(0, 0);
        _upLabel.transform=CGAffineTransformMakeRotation(M_PI/10);
        _downLabel.transform=CGAffineTransformMakeTranslation(0, 0);
        _downLabel.transform=CGAffineTransformMakeRotation(M_PI/10);
        _leftLabel.transform=CGAffineTransformMakeTranslation(0, 0);
        _leftLabel.transform=CGAffineTransformMakeRotation(M_PI/10);
        _rightLabel.transform=CGAffineTransformMakeTranslation(0, 0);
        _rightLabel.transform=CGAffineTransformMakeRotation(M_PI/10);
    }];
}
-(void)btnclicked
{
    _isShow=!_isShow;
    if (_isShow==YES) {
        [self show];
    }else
    {
        [self noShow];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
