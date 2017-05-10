//
//  ViewController.m
//  UIAlertController
//
//  Created by YY on 16/11/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong, nullable) void (^completionHandler)(UIImage *image);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    imageview.layer.cornerRadius=30;
    imageview.clipsToBounds=YES;
    imageview.tag=0xa100;
    [self.view addSubview:imageview];
    imageview.backgroundColor=[UIColor redColor];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked)];
    [imageview addGestureRecognizer:tap];
    imageview.userInteractionEnabled=YES;
    
}
-(void)tapClicked
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof(self) WeakSelf =self;
    
    UIAlertAction *action1=[UIAlertAction actionWithTitle:NSLocalizedString(@"相机", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [WeakSelf showImagePickerWithSourceTypeCamera:YES];
    }];
    [alertController addAction:action1];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:NSLocalizedString(@"相册", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [WeakSelf showImagePickerWithSourceTypePhotoLibrary:YES];
    }];
    [alertController addAction:action2];
    UIAlertAction *action3=[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action3];
    UIPopoverPresentationController *poppController = [alertController popoverPresentationController];//UIAlertControllerStyleActionSheet和UIPopoverPresentationController一起用！单独用UIAlertControllerStyleActionSheet用会崩溃！单独只能用UIAlertControllerStyleAlert
    CGFloat viewWidth = [[self view] bounds].size.width, viewHeight = [[self view] bounds].size.height;
    [poppController setSourceView:[self view]];
    [poppController setSourceRect:CGRectMake(0.5 * viewWidth, viewHeight, 0, 0)];
    [poppController setPermittedArrowDirections:UIPopoverArrowDirectionDown];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        if (!image) {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        if (image) {
//            [self completionHandler](image);
            UIImageView *imageview=[self.view viewWithTag:0xa100];
            imageview.image=image;
        }
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)showImagePickerWithSourceTypeCamera:(BOOL)allowEditing
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setMediaTypes:@[@"public.image"]];
    [imagePicker setAllowsEditing:allowEditing];
    [imagePicker setDelegate:self];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceFront];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
   
}
- (void)showImagePickerWithSourceTypePhotoLibrary:(BOOL)allowEditing
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setMediaTypes:@[@"public.image"]];
    [imagePicker setAllowsEditing:allowEditing];
    [imagePicker setDelegate:self];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
