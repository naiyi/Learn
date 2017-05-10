//
//  ViewController.m
//  UIGraphicsBeginImageContext制图
//
//  Created by yosemite on 16/9/7.
//  Copyright © 2016年 organization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"----%@----",infoDictionary);
    // app名称
    NSString *name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"----%@----",name);
    // app版本
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"----%@-----",version);
    // app build版本
    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"----%@----",build);
    */
    
    
//    self.view.backgroundColor=[UIColor blackColor];
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(16, 1050 / 1334.0 * [[self view] bounds].size.height, [[self view] bounds].size.width - 32, 230 / 1334.0 * [[self view] bounds].size.height)];
//    redView.backgroundColor=[UIColor redColor];
//    [[self view] addSubview:redView];
//    
//    UIView *borderView = [self laceBorderViewWithBounds:CGRectMake(0, 0, [redView bounds].size.width, 10)];
//    [borderView setFrame:CGRectMake([redView frame].origin.x, [redView frame].origin.y - 10, [redView bounds].size.width, 10)];
//    [[self view] addSubview:borderView];
    


   
 
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddCurveToPoint(context, 0, 50, 300, 250, 300, 400);
    CGContextStrokePath(context);
}
- (UIView *)laceBorderViewWithBounds:(CGRect)bounds {
    CGFloat radius = bounds.size.height / 2;
    int numOfArc = bounds.size.width / radius / 2;
    radius = bounds.size.width / (numOfArc + 1) / 2;
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat CCR = 0, CCG = 0, CCB = 0, CCA = 0;
//    [[[self view] backgroundColor] getRed:&CCR green:&CCG blue:&CCB alpha:&CCA];
  
    CGContextSetRGBFillColor(context, CCR, CCG, CCB, CCA);
    CGContextFillRect(context, bounds);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, CGRectMake(0, radius, bounds .size.width, bounds.size.height - radius));
    
    for (CGFloat x = radius; x < bounds.size.width; x += (2 * radius)) {
        CGContextAddArc(context, x, radius, radius, 0, M_PI, 1);
    }
    CGContextClosePath(context);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

- (UIImage *)rescaleImage:(UIImage *)img ToSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect]; // scales image to rect
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}
- (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height
{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGRect myImageRect = CGRectMake(10.0, 10.0, 57.0, 57.0);
    UIImage* bigImage= [UIImage imageNamed:@"k00030.jpg"];
    CGImageRef imageRef = bigImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size;
    size.width = 57.0;
    size.height = 57.0;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2
{
    UIGraphicsBeginImageContext(image1.size);
    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    // Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}
+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect
{
    return nil;
}
+ (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
