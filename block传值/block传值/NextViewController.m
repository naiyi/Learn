//
//  NextViewController.m
//  block传值
//
//  Created by YY on 2017/1/16.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (nonatomic,strong)UILabel *label;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor=[UIColor yellowColor];
    _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 120, 150, 30)];
    _label.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_label];
    
    
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
