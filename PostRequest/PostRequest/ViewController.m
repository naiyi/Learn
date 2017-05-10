//
//  ViewController.m
//  PostRequest
//
//  Created by YY on 2017/3/29.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
//#import "YYNetworking.h"
#import "YYNetworkingManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [YYNetworkingManager POST:@"http://sov.aeroip.net:8180/cms-aeroip/app/phone_queryHotsList" parameters:@"appkey=e270c8272cf4c3786da083440Da2577fip" success:^(id responseObject) {
        NSLog(@"====%@=====",[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil]);
    } failure:^(NSError *error) {
       // NSLog(@"---%@----",error);
    }];
    
    
    
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
