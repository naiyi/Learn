//
//  ViewController.m
//  UIImagePickerController
//
//  Created by yosemite on 16/10/24.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *HeadImage=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    HeadImage.userInteractionEnabled=YES;
    HeadImage.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:HeadImage];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked:)];
    [HeadImage addGestureRecognizer:tap];
    
}
-(void)tapClicked:(UITapGestureRecognizer *)tap
{
  
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIImagePickerController *pickerCon=[[UIImagePickerController alloc]init];
    pickerCon.delegate=self;
    pickerCon.allowsEditing=YES;
    
    __weak typeof(self) __block WeakSelf=self;
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            pickerCon.sourceType=UIImagePickerControllerSourceTypeCamera;
            pickerCon.cameraDevice=UIImagePickerControllerCameraDeviceRear;
            [WeakSelf presentViewController:pickerCon animated:YES completion:nil];
        }
        NSLog(@"相机");
    }];
    [alertController addAction:action1];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerCon.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            [WeakSelf presentViewController:pickerCon animated:YES completion:nil];
        }
        NSLog(@"相册");
    }];
    [alertController addAction:action2];
    UIAlertAction *action3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertController addAction:action3];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
