//
//  ViewController.m
//  UIWebView
//
//  Created by yosemite on 16/9/29.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
//    webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
//    webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    [self.view addSubview:webView];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://chta.starmeeting.com:8280/chtalink-web/share/sharedynamiclist"]];
    [webView loadRequest:request];
//    加载本地资源
//    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//    NSURL *url=[NSURL fileURLWithPath:filePath];
//    NSURLRequest *request=[NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    
    webView.delegate=self;
//    [webView goBack];
//    [webView goForward];
//    [webView reload];//重载
//    [webView stopLoading];//取消载入内容
    
//    webView.backgroundColor=[UIColor clearColor];
//    webView.opaque=NO;//这句话很重要，webView是否是不透明的，no为透明 在webView下添加个imageView展示图片就可以了
//
    
}
//      当网页视图被指示载入内容而得到通知。应当返回YES，这样会进行加载。通过导航类型参数可以得到请求发起的原因
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"+++%ld+++",(long)navigationType);
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    NSString *docStr=[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.textContent"];//获取web页面内容信息，此处获取的是个json字符串
    
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('test js OC')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert
    
    
    context[@"test1"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
    //此处我们没有写后台（但是前面我们已经知道iOS是可以调用js的，我们模拟一下）
    //首先准备一下js代码，来调用js的函数test1 然后执行
    //一个参数
    NSString *jsFunctStr=@"test1('参数1')";
    [context evaluateScript:jsFunctStr];
    
    //二个参数
    NSString *jsFunctStr1=@"test1('参数a','参数b')";
    [context evaluateScript:jsFunctStr1];
    
}
//- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script; 通过javaScript操作web数据
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
