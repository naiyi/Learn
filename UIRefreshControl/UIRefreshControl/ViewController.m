//
//  ViewController.m
//  UIRefreshControl
//
//  Created by yosemite on 16/10/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "NextTableViewController.h"
#import "AnotherTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor orangeColor];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch=[touches anyObject];
//    CGPoint point=[touch locationInView:self.view];
////    NSLog(@">>>>>>>>x=%f-------y=%f<<<<<<<<<",point.x,point.y);
//    if (point.x>=self.view.frame.size.width/2) {
        NextTableViewController *nextVC=[[NextTableViewController alloc]init];
        [self presentViewController:nextVC animated:YES completion:nil];
//    }
//    else{
//    AnotherTableViewController *anotherVC=[[AnotherTableViewController alloc]init];
//    [self presentViewController:anotherVC animated:YES completion:nil];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
