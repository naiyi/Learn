//
//  ViewController.m
//  FLPayManagerDemo
//
//  Created by clarence on 16/11/30.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import "ViewController.h"
#import "FLPayManager.h"
#import "firstViewController.h"
#import "secondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"gitKong 你好！";
    
    CGFloat width = self.view.bounds.size.width;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((width - 100) / 2, 200, 100, 40)];
    [btn setTitle:@"微信支付" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(wechatPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake((width - 100) / 2, 400, 100, 40)];
    [btn1 setTitle:@"支付宝支付" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 addTarget:self action:@selector(aliPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}


- (void)wechatPay {
    [self jumpToBizPay];
}

- (void)aliPay{
    
    /**
     *  @author gitKong
     *
     *  来自支付宝文档数据
     */
    NSString *orderMessage = @"charset=utf-8&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.01%22%2C%22subject%22%3A%22%E7%88%86%E7%B1%B3%E8%8A%B1%22%2C%22body%22%3A%22%22%2C%22out_trade_no%22%3A%221202160702-4243%22%7D&method=alipay.trade.app.pay&notify_url=https%3A%2F%2Fsov.aeroip.net%3A8443%2Fcrm-webapp%2Fpay%2FalipayAsynNotification&app_id=2016082901818734&sign_type=RSA&version=1.0&timestamp=2016-12-02+16%3A07%3A02&sign=p6Ofd00A8CBtksiCRvF911cqYYcvaIXBz6GjQOdLm9NoNGXeBD7W2QYw0CqpWmZKeehEFvi3yeQJQ7AJnWzhZR17oHviCHeA67hQ5D2pZS%2FI%2BTK4eSI7GrmO2ZfZR8zRdNqnVRM%2Fk7ZeLg%2BYVhm7mhOtZEdgPnu5N34iI56d4W0%3D";
    [FLPAYMANAGER fl_payWithOrderMessage:orderMessage callBack:^(FLErrCode errCode, NSString *errStr) {
        NSLog(@"errCode = %zd,errStr = %@",errCode,errStr);
        if (errCode==0) {
            firstViewController *firtstVC=[[firstViewController alloc]init];
            [self presentViewController:firtstVC animated:YES completion:nil];
        }
        
    }];
    secondViewController *secondVC=[[secondViewController alloc]init];
    [self presentViewController:secondVC animated:YES completion:nil];
}


- (NSString *)jumpToBizPay {
    
    //============================================================
    /**
     *  @author Clarence
     *
     *  来自微信文档数据
     */
    //============================================================
    NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
    //解析服务端返回json数据
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if ( response != nil) {
        NSMutableDictionary *dict = NULL;
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        NSLog(@"url:%@",urlString);
        if(dict != nil){
            NSMutableString *retcode = [dict objectForKey:@"retcode"];
            if (retcode.intValue == 0){
                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
                
                //调起微信支付
                PayReq* req             = [[PayReq alloc] init];
                req.partnerId           = [dict objectForKey:@"partnerid"];
                req.prepayId            = [dict objectForKey:@"prepayid"];
                req.nonceStr            = [dict objectForKey:@"noncestr"];
                req.timeStamp           = stamp.intValue;
                req.package             = [dict objectForKey:@"package"];
                req.sign                = [dict objectForKey:@"sign"];
                
                [FLPAYMANAGER fl_payWithOrderMessage:req callBack:^(FLErrCode errCode, NSString *errStr) {
                    NSLog(@"errCode = %zd,errStr = %@",errCode,errStr);
                }];
                
                //日志输出
                NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
                return @"";
            }else{
                return [dict objectForKey:@"retmsg"];
            }
        }else{
            return @"服务器返回错误，未获取到json对象";
        }
    }else{
        return @"服务器返回错误";
    }
}


@end
