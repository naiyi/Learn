//
//  MyBarCodeController.m
//  BeYou
//
//  Created by qingshan on 16/4/26.
//  Copyright © 2016年 HQS. All rights reserved.
//

#import "MyBarCodeController.h"
#import <AVFoundation/AVFoundation.h>

//视图的宽度
#define WIDTH_FULL_SCREEN       ([UIScreen mainScreen].bounds.size.width)
//视图的高度
#define HEIGHT_FULL_SCREEN      ([UIScreen mainScreen].bounds.size.height)
//除导航栏和状态栏外的视图的高度
#define HEIGHT_FULL_VIEW      (([UIScreen mainScreen].bounds.size.height) - 64)

@interface MyBarCodeController ()<AVCaptureMetadataOutputObjectsDelegate> {
    CGFloat imageSize;
    CGFloat originalTop;
    BOOL torchIsOn;
    BOOL up;
}

//计时器
@property(nonatomic,strong) CADisplayLink * link;
@property(nonatomic,strong) AVCaptureSession *session;

@end

@implementation MyBarCodeController

- (void)setUp {
    imageSize = 200;
    originalTop = 75;
    torchIsOn = NO;
    up = NO;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.view.frame = CGRectMake(0, 0, WIDTH_FULL_SCREEN, HEIGHT_FULL_VIEW);
    [self setUp];
    if (self.pageType == MyBarCodeControllerPageTypeScan) {
        self.title = @"扫一扫";
    }
    else if (self.pageType == MyBarCodeControllerPageTypeBind) {
        self.title = @"绑定会员卡";
    }
    else {
        self.title = @"扫一扫";
    }
    
    CADisplayLink * link=[CADisplayLink displayLinkWithTarget:self selector:@selector(move)];
    self.link=link;
    
    // 1.获取输入设备(摄像头)
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 2.根据输入设备创建输入对象
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:NULL];
    
    if (input==nil) {
        return;
    }
    // 3.创建输出对象
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    // 4.设置代理监听输出对象输出的数据
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 5.创建会话(桥梁)
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    // 6.添加输入和输出到会话中（判断session是否已满）
    if ([session canAddInput:input]) {
        [session addInput:input];
    }
    if ([session canAddOutput:output]) {
        [session addOutput:output];
    }
    // 7.告诉输出对象, 需要输出什么样的数据 (二维码还是条形码)
    output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeUPCECode,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeAztecCode,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeCode39Mod43Code];
    
    // 8.创建预览图层
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    previewLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:previewLayer atIndex:0];
    
    //设置感应区域
//    CGRect rect = CGRectMake((WIDTH_FULL_SCREEN - imageSize) / 2, originalTop, imageSize, imageSize);
//    CGRect intertRect = [previewLayer metadataOutputRectOfInterestForRect:rect];
//    CGRect layerRect = [previewLayer rectForMetadataOutputRectOfInterest:intertRect];
//    NSLog(@"%@,  %@",NSStringFromCGRect(intertRect),NSStringFromCGRect(layerRect));
//    output.rectOfInterest = layerRect;//[previewLayer metadataOutputRectOfInterestForRect:rect];
    
    // 8.开始扫描数据
    [session startRunning];
    self.session = session;
    
    //设置中空区域
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_FULL_SCREEN, HEIGHT_FULL_VIEW)];
    maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [self.view addSubview:maskView];
    [self.view bringSubviewToFront:self.flashButton];
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, WIDTH_FULL_SCREEN, HEIGHT_FULL_VIEW)];
    [rectPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake((WIDTH_FULL_SCREEN - imageSize) / 2, originalTop, imageSize, imageSize) cornerRadius:1] bezierPathByReversingPath]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = rectPath.CGPath;
    maskView.layer.mask = shapeLayer;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
// 扫描到数据时会调用
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count > 0) {
        // 1.停止扫描
        [self.session stopRunning];
        // 2.停止冲击波
        [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
         
        // 3.取出扫描到得数据
        AVMetadataMachineReadableCodeObject *obj = [metadataObjects lastObject];
        
        //处理结果
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"扫描结果" message:[obj stringValue] preferredStyle:UIAlertControllerStyleAlert];
        [alertCtrl addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.session startRunning];
            [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        }]];
        [self presentViewController:alertCtrl animated:YES completion:nil];
    }
}

-(void)move
{
    if (up == YES) {
        self.lineTop.constant += 2;
        if (self.lineTop.constant >= originalTop + imageSize - 19) {
            up = NO;
        }
    }
    else {
        self.lineTop.constant -= 2;
        if (self.lineTop.constant <= originalTop) {
            up = YES;
        }
    }
}

- (IBAction)flashAction:(id)sender {
    torchIsOn = !torchIsOn;
    [self turnTorchOn:torchIsOn];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.session startRunning];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.session stopRunning];
}

- (void) turnTorchOn: (BOOL) on {
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            [device lockForConfiguration:nil];
            if (on) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                torchIsOn = YES;
            }
            else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                torchIsOn = NO;
            }
            [device unlockForConfiguration];
        }
    }
}

@end
