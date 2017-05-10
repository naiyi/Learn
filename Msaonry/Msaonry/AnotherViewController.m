//
//  AnotherViewController.m
//  Msaonry
//
//  Created by yosemite on 16/10/13.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "AnotherViewController.h"
#import "ViewController.h"
@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor cyanColor];
    [self test2];
//    NSString *path1= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
//    [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
    
    
    
    
}
-(void)test2
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *sex=[defaults objectForKey:@"sex"];
    NSString *age=[defaults objectForKey:@"age"];
    NSLog(@"----%@-----%@------",sex,age);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController *view=[[ViewController alloc]init];
    [self presentViewController:view animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
