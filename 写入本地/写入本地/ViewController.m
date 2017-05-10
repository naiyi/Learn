//
//  ViewController.m
//  写入本地
//
//  Created by YY on 2017/3/2.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "CCLogSystem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *filePath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    NSString *fileName=[filePath stringByAppendingPathComponent:@"list.txt"];
//    
//    NSMutableArray *arr=[NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//    
//    
//    NSFileManager *manager=[NSFileManager defaultManager];
//    if ([manager fileExistsAtPath:fileName]) {
//        [@"qweq" writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        BOOL ret= [arr writeToFile:fileName atomically:YES];
//    
//        if (ret) {
//            NSLog(@"成功了");
//        }else{
//            NSLog(@"失败了");
//        }
//    }else{
//        
//    }

    
    
//    NSMutableArray *arr1=[NSMutableArray arrayWithContentsOfFile:fileName];
//    
//    NSLog(@"--%@--",arr1);
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CCLogSystem activeDeveloperUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
