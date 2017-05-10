//
//  ViewController.m
///Users/yosemite/Desktop/souyinbao/souyinbao.xcodeproj  iOS保存图片或者视图到本地相册
//
//  Created by YY on 2017/1/10.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.size.width-200, self.view.frame.size.width-200)];
    imageView.image=[UIImage imageNamed:@"111"];
    [self.view addSubview:imageView];
    imageView.tag=0x111;
    
    
    
    UILongPressGestureRecognizer *longGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGesture:)];
    [self.view addGestureRecognizer:longGesture];
}
-(void)longGesture:(UILongPressGestureRecognizer *)gesture{
    UIImageView*imageView=[self.view viewWithTag:0x111];
    UIGraphicsBeginImageContext(imageView.bounds.size);
    
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"失败");
    }else{
        NSLog(@"成功");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
