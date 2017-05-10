//
//  ViewController.m
//  Button
//
//  Created by yosemite on 16/9/20.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYButton.h"
@interface ViewController ()
@property (nonatomic,strong)UIButton *decreaseBtn;
@property (nonatomic,strong)UIButton *increaseBtn;
@property (nonatomic,strong)UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
//    YYButton *btn=[[YYButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
//    [self.view addSubview:btn];
    [self setUpButton];
    
    
   
}

-(UIView *)setUpButton
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:view];
    view.backgroundColor=[UIColor whiteColor];
    view.layer.cornerRadius=5;
    view.clipsToBounds=YES;
    NSAttributedString *attributeString1=[[NSAttributedString alloc]initWithString:@"-" attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor greenColor]}];
    _decreaseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _decreaseBtn.frame=CGRectMake(5, 5, 20, 20);
    _decreaseBtn.layer.borderColor=[UIColor grayColor].CGColor;
    _decreaseBtn.layer.borderWidth=1;
    
    [_decreaseBtn setAttributedTitle:attributeString1 forState:UIControlStateNormal];
    [_decreaseBtn addTarget:self action:@selector(decreaseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_decreaseBtn];
    
    
    NSAttributedString *attributeString2=[[NSAttributedString alloc]initWithString:@"+" attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor redColor]}];
    _increaseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _increaseBtn.frame=CGRectMake(view.frame.size.width-25, 5, 20, 20);
    _increaseBtn.layer.borderColor=[UIColor grayColor].CGColor;
    _increaseBtn.layer.borderWidth=1;
    [_increaseBtn setAttributedTitle:attributeString2 forState:UIControlStateNormal];
    [_increaseBtn addTarget:self action:@selector(increaseBtned:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_increaseBtn];
    
    _textLabel=[[UILabel alloc]initWithFrame:CGRectMake(25, 5, 50, 20)];
    _textLabel.textAlignment=NSTextAlignmentCenter;
    _textLabel.layer.borderColor=[UIColor grayColor].CGColor;
    _textLabel.layer.borderWidth=1;
    _textLabel.text=@"1";
    [view addSubview:_textLabel];
    return view;
    
}
-(void)decreaseBtnClicked:(UIButton *)decreaseBtn
{
    _textLabel.text.length == 0 ? _textLabel.text = @"1" : nil;
    NSInteger number = [_textLabel.text integerValue] - 1;
    if (number<=0) {
        _textLabel.text =@"1";
    }else
        _textLabel.text = [NSString stringWithFormat:@"%ld", number];
    
}
-(void)increaseBtned:(UIButton *)increaseBtn
{
    _textLabel.text.length == 0 ? _textLabel.text = @"1" : nil;
    NSInteger number = [_textLabel.text integerValue] + 1;
    if (number > 0)
    {
        _textLabel.text = [NSString stringWithFormat:@"%ld", number];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
