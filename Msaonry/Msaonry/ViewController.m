//
//  ViewController.m
//  Msaonry
//
//  Created by yosemite on 16/10/13.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "AnotherViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    UIView *view=[UIView new];
    view.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
       
    }];
    
    UIView *view2=[UIView new];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    */
    self.view.backgroundColor=[UIColor orangeColor];
    NSString *path1= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path2= NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path3= NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *path4=NSTemporaryDirectory();
    
    NSLog(@"------%@-------",path1);
    NSLog(@"------%@-------",path2);
    NSLog(@"------%@-------",path3);
    NSLog(@"------%@-------",path4);
    
    NSString *filePath=[path1 stringByAppendingString:@"ball.plist"];
    NSArray *arr=@[@"123",@"456",@"789"];
    [arr writeToFile:filePath atomically:YES];
    NSLog(@">>>>>%@<<<<",[NSArray arrayWithContentsOfFile:filePath]);
    
    [self test1];
//    [self test2];
//    
//    Person *p1=[Person new];
//    
//   [NSKeyedArchiver archiveRootObject:p1 toFile:path1];

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AnotherViewController *anotherVC=[[AnotherViewController alloc]init];
    [self presentViewController:anotherVC animated:YES completion:nil];
}
-(void)test1
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@"man" forKey:@"sex"];
    [defaults setObject:@"21" forKey:@"age"];
    [defaults synchronize];//同步
}

-(void)test2
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *sex=[defaults objectForKey:@"sex"];
    NSString *age=[defaults objectForKey:@"age"];
    NSLog(@"----%@-----%@------",sex,age);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
