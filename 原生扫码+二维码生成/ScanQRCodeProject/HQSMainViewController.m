//
//  HQSMainViewController.m
//  ScanQRCodeProject
//
//  Created by qingshan on 16/5/1.
//  Copyright © 2016年 WYZC. All rights reserved.
//

#import "HQSMainViewController.h"
#import "MyBarCodeController.h"

@interface HQSMainViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *codeStringField;
@end

@implementation HQSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码和二维码生成";
    
    //如果还想加上阴影，就在ImageView的Layer上使用下面代码添加阴影
    self.imageView.layer.shadowOffset=CGSizeMake(0.5, 0.5);//设置阴影的偏移量
    self.imageView.layer.shadowRadius=1;//设置阴影的半径
    self.imageView.layer.shadowColor=[UIColor blackColor].CGColor;//设置阴影的颜色为黑色
    self.imageView.layer.shadowOpacity=0.5;
    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.borderWidth = 0.5f;
    
    self.codeStringField.delegate = self;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.codeStringField resignFirstResponder];
    return YES;
}

- (IBAction)scanAction:(id)sender {
    MyBarCodeController *ctrl = [[MyBarCodeController alloc] initWithNibName:@"MyBarCodeController" bundle:nil];
    ctrl.pageType = MyBarCodeControllerPageTypeScan;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ctrl];
    nav.title = @"扫一扫";
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)generateCode:(id)sender {
    [self erweima];
}

- (void)erweima {
    if ([self.codeStringField.text isEqualToString:@""]) {
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入二维码生成信息" preferredStyle:UIAlertControllerStyleAlert];
        [alertCtrl addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.codeStringField becomeFirstResponder];
        }]];
        [self presentViewController:alertCtrl animated:YES completion:nil];
        return;
    }
    //二维码滤镜
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    //恢复滤镜的默认属性
    [filter setDefaults];
    //将字符串转换成NSData
    NSData *data=[self.codeStringField.text dataUsingEncoding:NSUTF8StringEncoding];
    //通过KVO设置滤镜inputmessage数据
    [filter setValue:data forKey:@"inputMessage"];
    //获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
   
    //将CIImage转换成UIImage,并放大显示
    self.imageView.image = [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
}

//改变二维码大小
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
