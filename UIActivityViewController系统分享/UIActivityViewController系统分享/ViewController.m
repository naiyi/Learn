//
//  ViewController.m
//  UIActivityViewController系统分享
//
//  Created by YY on 2017/4/21.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:@"分享的title"];
    [items addObject:[[NSBundle mainBundle] URLForResource:@"iOS XMPP - 简书" withExtension:@"pdf"]];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
//    NSMutableArray *excludedActivityTypes =  [NSMutableArray arrayWithArray:@[UIActivityTypeAirDrop, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeMail, UIActivityTypePostToTencentWeibo, UIActivityTypeSaveToCameraRoll, UIActivityTypeMessage, UIActivityTypePostToTwitter]];
//    activityViewController.excludedActivityTypes = excludedActivityTypes;
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





















































@end
