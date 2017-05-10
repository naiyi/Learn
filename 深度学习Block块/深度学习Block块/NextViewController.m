//
//  NextViewController.m
//  深度学习Block块
//
//  Created by YY on 2017/3/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"
@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;




@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btn:(id)sender {
    
//    if (self.delegate&&[self.delegate respondsToSelector:@selector(PassTextValue:)]) {
//        [self.delegate  PassTextValue:self.textField.text];
//    }
    
    if (self.NextVCBlock) {
        self.NextVCBlock(self.textField.text);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
