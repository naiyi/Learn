//
//  WebViewController.m
//  51网易
//
//  Created by YY on 16/4/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end


@implementation WebViewController
+(void)initialize
{
    [[UIBarButtonItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden=YES;
    
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate=self;
    NSURL *url = [NSURL URLWithString:_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView  loadRequest:request];
    
    [self.view addSubview:webView];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//        NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";
//        NSString *HTMLSource = [webView stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
//        NSLog(@"data===++++%@====++++",HTMLSource);
//
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('u_topmenu clearfix')[0].style.display = 'none';"];
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('m_photoset m_article list-item clearfix')[0].style.display = 'none';"];
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('a_adtemp a_tbad js-tbad')[0].style.display = 'none';"];
////    可以
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('more_client more-client')[0].style.display = 'none';"];
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.getElementsByClassName('u_c_items')[0].style.display = 'none';"];
//    
//   
//        [webView stringByEvaluatingJavaScriptFromString:@"javascript:document.getElementById('article_container').style.display='none';"];
//    [webView stringByEvaluatingJavaScriptFromString:@"javascript:document.getElementById('share_mask js-share-mask').style.display='none';"];
//
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
