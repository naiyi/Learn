//
//  ViewController.m
//  YYKeyChain
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYKeyChain.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *showLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [YYKeyChain save_key:@"userName" data_values:@"1234567"];
    
}

- (IBAction)btn:(id)sender {
    self.showLB.text=[YYKeyChain load_key:@"userName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
