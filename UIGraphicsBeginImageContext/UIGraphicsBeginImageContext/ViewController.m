//
//  ViewController.m
//  UIGraphicsBeginImageContext
//
//  Created by yosemite on 16/10/8.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CustomView *view=[[CustomView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:view];
    

    
    
    UIGraphicsBeginImageContext(CGSizeMake(10, 10));
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 150 / 255.0, 50 / 255.0, 150 / 255.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    imageview.layer.cornerRadius=100;
//    imageview.clipsToBounds=YES;
//    imageview.layer.masksToBounds=YES;
//    imageview.image=image;
//    imageview.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:imageview];
//    NSArray *arr=[NSArray array];
//    if ([arr count]==0) {
//        NSLog(@"=========");
//    }
//    NSLog(@"+++111++%@++111++",image);
//    UIImage *img=[self rescaleImage:image ToSize:CGSizeMake(100, 100)];
//    NSLog(@"+++222++%@++222++",img);
//    imageview.image=[UIImage imageNamed:@"UserProfile背景"];
//   UIImage *newImg=[self getNewImageFormImage:[UIImage imageNamed:@"UserProfile背景"]];
//    imageview.image=newImg;
    
    
}
//    重新设置图片的尺寸
-(UIImage *)rescaleImage:(UIImage *)img ToSize:(CGSize)size{
    CGRect rect=CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect];
    UIImage *resImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    return resImage;
}
//  从一个图片上截取一个区域得到的新图
-(UIImage *)getNewImageFormImage:(UIImage*)image{
    CGRect newImageRect=CGRectMake(70, 70, image.size.width-140, image.size.height-140);
    CGImageRef imageRef=image.CGImage;
    CGImageRef subImageRef=CGImageCreateWithImageInRect(imageRef, newImageRect);
    CGSize size;
    size.width=newImageRect.size.width;
    size.height=newImageRect.size.height;
    UIGraphicsBeginImageContext(size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, newImageRect, subImageRef);
    UIImage *newImage=[UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


















@end
