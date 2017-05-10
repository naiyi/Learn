//
//  ViewController.h
//  UIGraphicsBeginImageContext制图
//
//  Created by yosemite on 16/9/7.
//  Copyright © 2016年 organization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (UIImage *)rescaleImage:(UIImage *)img ToSize:(CGSize)size; //图片缩放裁剪

- (UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height; //改变大小

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2; //合并图片

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect; //裁剪部分图片

+ (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo; //保存图片到媒体库
@end

