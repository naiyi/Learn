//
//  ViewController.m
//  获取系统邮箱地址
//
//  Created by YY on 2017/3/13.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"+++++%@++++++",[self systemEmailsList]);
}
- (NSArray*)systemEmailsList{
    
    NSString *path = @"/var/mobile/Library/Preferences/com.apple.accountsettings.plist";
    NSDictionary *accountDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *accounts = [accountDic valueForKey:@"Accounts"];
    NSMutableArray *emailListArray = [NSMutableArray array];
    
    for(NSDictionary *account in accounts) {
        NSString *classValue = [account valueForKey:@"Class"];
        if([classValue isEqualToString:@"POPAccount"])    {
            [emailListArray addObject:[NSString stringWithFormat:@"%@",[account objectForKey:@"Username"]]];
        }
        if([classValue isEqualToString:@"GmailAccount"])   {
            [emailListArray addObject:[NSString stringWithFormat:@"%@",[account objectForKey:@"Username"]]];
        }
        
        if([classValue isEqualToString:@"IMAPAccount"])    {
            [emailListArray addObject:[NSString stringWithFormat:@"%@",[account objectForKey:@"Username"]]];
        }
        
        if([classValue isEqualToString:@"YahooAccount"])   {
            [emailListArray addObject:[NSString stringWithFormat:@"%@",[account objectForKey:@"Username"]]];
        }
    }
    return emailListArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
