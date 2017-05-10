//
//  ViewController.m
//  TestOne
//
//  Created by YY on 2017/5/4.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYAlertViewController.h"
@interface ViewController ()
@property (nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 5*NSEC_PER_SEC),1.0*NSEC_PER_SEC, 0); //每秒执行
//    dispatch_source_set_event_handler(timer, ^{
//        //@"倒计时结束，关闭"
//        
//    });
//    dispatch_resume(timer);
   
    
//    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
//    view.backgroundColor=[UIColor orangeColor];
//    [self.view addSubview:view];
//    
//    UIImage *image=[UIImage imageNamed:@"屏幕快照 2017-05-04 16.03.20"];
//    view.layer.contents=(__bridge id _Nullable)(image.CGImage);
//    view.layer.contentsRect=CGRectMake(0, 0, 1, 1);
//    
//    
//    Class c =NSClassFromString(@"LSApplicationWorkspace");
//    id s = [(id)c performSelector:NSSelectorFromString(@"defaultWorkspace")];
//    NSArray *array = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
//    for (id item in array)
//    {
//        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"applicationIdentifier")]);
////        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"bundleIdentifier")]);
//        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"bundleVersion")]);
//        NSLog(@"%@",[item performSelector:NSSelectorFromString(@"shortVersionString")]);
//    }
    
    
    
    
//    NSString *string = @"http://abc.com?aaa=你好&bbb=tttee";
//    
//    //编码 打印：http://abc.com?aaa=%E4%BD%A0%E5%A5%BD&bbb=tttee
//    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSLog(@"==1==%@==1===",string);
//    //解码 打印：http://abc.com?aaa=你好&bbb=tttee
//    string = [string stringByRemovingPercentEncoding];
//    NSLog(@"==2==%@==2===",string);
//    
//    
//    
//    NSLog(@"-------%f---%f",ceil(8.8),floor(8.8));
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    YYAlertViewController *alertVC=[[YYAlertViewController alloc] initWithAlertViewController];
    [alertVC showAlertViewControntroller];
    NSLog(@"++++++++++++++");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




































@end
