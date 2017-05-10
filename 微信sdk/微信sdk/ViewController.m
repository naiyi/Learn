//
//  ViewController.m
//  微信sdk
//
//  Created by yosemite on 16/9/28.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
@interface ViewController ()
//@interface WXMediaMessage : NSObject

//+(WXMediaMessage *) message;
//
///** 标题
// * @note 长度不能超过512字节
// */
//@property (nonatomic, retain) NSString *title;
///** 描述内容
// * @note 长度不能超过1K
// */
//@property (nonatomic, retain) NSString *description;
///** 缩略图数据
// * @note 大小不能超过32K
// */
//@property (nonatomic, retain) NSData   *thumbData;
///**
// * @note 长度不能超过64字节
// */
//@property (nonatomic, retain) NSString *mediaTagName;
///**
// *
// */
//@property (nonatomic, retain) NSString *messageExt;
//@property (nonatomic, retain) NSString *messageAction;
///**
// * 多媒体数据对象，可以为WXImageObject，WXMusicObject，WXVideoObject，WXWebpageObject等。
// */
//@property (nonatomic, retain) id        mediaObject;
//
///*! @brief 设置消息缩略图的方法
// *
// * @param image 缩略图
// * @note 大小不能超过32K
// */
//- (void) setThumbImage:(UIImage *)image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titleArr=[NSArray arrayWithObjects:@"分享纯文本",@"分享图片",@"微信登录",@"微信",@"微信授权", nil];
    for (NSInteger i=0; i<5; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(100, 100+80*i, self.view.frame.size.width-200, 50);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
       
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i;
        [self.view addSubview:btn];
    }
    
    
}
-(void)btnClicked:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            SendMessageToWXReq *req=[[SendMessageToWXReq alloc]init];
            req.text=@"123";
            req.bText=YES;
            req.scene=WXSceneFavorite;
            [WXApi sendReq:req];
        }
            break;
        case 1:
        {
            WXMediaMessage *message=[WXMediaMessage message];
            [message setThumbImage:[UIImage imageNamed:@"11"]];
            message.thumbData=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"11"]];
            
            WXImageObject *image= [WXImageObject object];
            image.imageData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"123" ofType:@".png"]];
            message.mediaObject=image;
            SendMessageToWXReq *req=[[SendMessageToWXReq alloc]init];
            req.bText=NO;
            req.message=message;
            req.scene=WXSceneFavorite;
            
            [WXApi sendReq:req];
            
            
        }
            break;
        case 2:
        {
            SendAuthReq* req =[[SendAuthReq alloc ] init ];
            req.scope = @"snsapi_userinfo" ;
            req.state = @"123" ;
            //第三方向微信终端发送一个SendAuthReq消息结构
            [WXApi sendReq:req];
        }
            break;
        case 3:
            
            break;
            
        default:
            break;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
