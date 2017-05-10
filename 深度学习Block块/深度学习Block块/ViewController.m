//
//  ViewController.m
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "BlockTest.h"
#import "YYDownloadManager.h"
#import "NextViewController.h"
//typedef void (^CallBack)();

@interface ViewController ()<NextViewControllerDelegate>

//@property (nonatomic,weak)CallBack back;
@property (nonatomic,strong)UILabel *myLabel;


@property(nonatomic,assign)int num;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor=[UIColor whiteColor];
//    int (^sum)(int a, int b)=^(int a, int b){
//        return a+b;
//    };
//    
//    NSLog(@"--%i--",sum(4,5));
//    
//    int (^testBlock) (int) = ^(int num) {
//        return num++;
//    };
//    NSLog(@"++++++%d++++++", testBlock(testBlock(testBlock(3))));
//    
//    
////    CGPoint center = cell.center;
////    CGPoint startCenter = center;
////    startCenter.y += LXD_SCREEN_HEIGHT;
////    cell.center = startCenter;
//    [UIView animateWithDuration: 0.5 delay: 0.35  usingSpringWithDamping: 0.6 initialSpringVelocity: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
////        cell.center = center;
//    } completion: ^(BOOL finished) {
////        NSLog("animation %@ finished", finished? @"is", @"isn't");
//    }];
//    
//    
//    [UIView animateWithDuration:1 animations:^{
//        
//    }];
//    
//    self.num = 1;
//
//    __block int a=0;
//    void (^block3) () = ^ {
//        self.num++;
//        a=7;
//    };
//    block3();
//    NSLog(@"~~%d~~%d",self.num,a);//输出结果为 3
    
//    [BlockTest clickedCallBack:^{
//        
//    }];
    
//    __weak typeof(self) WeakSelf1=self;
//    
//    __unsafe_unretained typeof(self) WeakSelf2=self;
//    
//    typeof(self) __weak WeakSelf3=self;
    
    
    [YYDownloadManager downloadWithURL:@"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryHotsList" parameters:@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip"} handler:^(NSData *receiveData, NSError *error) {
        NSLog(@"++++%@+++%@+++++",[NSJSONSerialization JSONObjectWithData:receiveData options:kNilOptions error:nil],error);
    } progress:^(CGFloat progress) {
        
    }];

    
    self.myLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    self.myLabel.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:self.myLabel];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NextViewController *nextVC=[[NextViewController alloc] init];
//    nextVC.delegate=self;
    
    nextVC.NextVCBlock=^(NSString *tfText){
        self.myLabel.text=tfText;
    };
    
    [self.navigationController pushViewController:nextVC animated:YES];
    
}
//  实现协议
-(void)PassTextValue:(NSString *)tfText{
    self.myLabel.text=tfText;
}
//-(void)clickedCallBack:(CallBack)back{
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
