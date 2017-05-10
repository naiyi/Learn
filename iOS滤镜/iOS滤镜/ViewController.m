//
//  ViewController.m
//  iOS滤镜
//
//  Created by YY on 2017/1/10.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)CIImage *orignalImage;
@property (nonatomic,strong)UIImageView *filterImageView;
@property (nonatomic,strong)UIImage *filterImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    //获取毛玻璃图片
//    self.orignalImage = [CIImage imageWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"111" withExtension:@"png"]];
//    //获取滤镜，并设置（使用KVO键值输入）
////    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:@"inputImage", self.orignalImage, @"inputRadius", @1.0f, nil];
//    CIFilter *filter=[[CIFilter alloc]init];
//    //从滤镜中获取图片
//    CIImage *result = filter.outputImage;
//    self.filterImage = [UIImage imageWithCIImage:result];
//    //将图片添加到filterImageView上
//    self.filterImageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:self.filterImageView];
//    self.filterImageView.image = self.filterImage;
    
    NSArray *arrs=[CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    for (NSString *str1 in arrs) {
        CIFilter *filter=[CIFilter filterWithName:str1];
        NSLog(@"%@",filter.attributes);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
