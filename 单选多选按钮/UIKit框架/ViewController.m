//
//  ViewController.m
//  UIKit框架
//
//  Created by YY on 16/11/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIActivityIndicatorView *_indicatorView;
    UIButton *_lastBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    /*
//    1.UIActivityIndicatorView
    _indicatorView=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _indicatorView.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _indicatorView.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:_indicatorView];
    
//    2.NSCalendar
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSInteger a=[calendar component:NSCalendarUnitHour fromDate:[NSDate date]];
    NSLog(@"%li",(long)a);
    [calendar isDateInToday:[NSDate date]];
    NSDateComponents *components=[calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate dateWithTimeIntervalSinceNow:60]];
    NSLog(@"--%@--",components);
     */
    CGFloat btnW=self.view.frame.size.width/2,btnH=40,btnMarginH=20;
    NSArray *arr1=[NSArray arrayWithObjects:@"中国",@"美国",@"日本",@"英国",@"俄罗斯", nil];
    for (NSInteger i=0; i<5; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake((self.view.frame.size.width-btnW)/2, 150+(btnH+btnMarginH)*i, btnW, btnH);
        [btn setTitle:arr1[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=0xa100;
        btn.backgroundColor=[UIColor orangeColor];
        btn.layer.cornerRadius=5;
        [self.view addSubview:btn];
    }

}
-(void)btnClicked:(UIButton *)btn
{
    
//    单选
//    if (!_lastBtn) {
//        btn.transform=CGAffineTransformMake(1.1, 0, 0, 1.1, 0, 0);
//        _lastBtn=btn;
//    }else if (_lastBtn&&_lastBtn==btn){
//        if (btn.transform.a==1) {
//            btn.transform=CGAffineTransformMake(1.1, 0, 0, 1.1, 0, 0);
//        }else{
//            btn.transform=CGAffineTransformIdentity;
//        }
//        _lastBtn=btn;
//    }else if (_lastBtn&&_lastBtn!=btn){
//        _lastBtn.transform=CGAffineTransformIdentity;
//        if (btn.transform.a==1) {
//            btn.transform=CGAffineTransformMake(1.1, 0, 0, 1.1, 0, 0);
//        }else{
//            btn.transform=CGAffineTransformIdentity;
//        }
//        _lastBtn=btn;
//    }
//    多选
    if (btn.transform.a==1) {
        btn.transform=CGAffineTransformMake(1.1, 0, 0, 1.1, 0, 0);
    }else{
        btn.transform=CGAffineTransformIdentity;
    }
   
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    if ([_indicatorView isAnimating]) {
//        [_indicatorView stopAnimating];
//    }else
//        [_indicatorView startAnimating];
//   
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
