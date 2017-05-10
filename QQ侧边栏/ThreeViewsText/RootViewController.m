//
//  RootViewController.m
//  ThreeViewsText
//
//  Created by lanouhn on 16/2/29.
//  Copyright © 2016年 老三   个人微信号 hao22221111     IOS微信公众号 D了个L    欢迎关注每天推送技术文章,项目源码, IOS技术交流源码分享QQ群 544124646 大牛多多哦
//

#import "RootViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"
#import "LeftViewController.h"
#import "UIImage+ImageEffects.h"
@interface RootViewController ()
{
    BOOL _isChange;
    BOOL _isH;
}

@property (nonatomic, strong) UIImageView *backimage;

@property (nonatomic, strong) UIView *playView;

@end

@implementation RootViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor greenColor];

    
    // Do any additional setup after loading the view.
}

/**
 *  重写init方法
 */
- (id)initWithCenterVC:(CenterViewController *)centerVC rightVC:(RightViewController *)rightVC leftVC:(LeftViewController *)leftVC {

    
    if (self = [super init]) {
        [self addChildViewController:leftVC];
        [self addChildViewController:rightVC];
        
    
        
        /*
        CIContext *context = [CIContext contextWithOptions:nil];
        CIImage *inputImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"1234"]];
        // create gaussian blur filter
        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
        [filter setValue:inputImage forKey:kCIInputImageKey];
        [filter setValue:[NSNumber numberWithFloat:5.0] forKey:@"inputRadius"];
        // blur image
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
        UIImage *image = [UIImage imageWithCGImage:cgImage];
        self.backimage.image = image;
*/
        
        UINavigationController *centerNC = [[UINavigationController alloc] initWithRootViewController:centerVC];
        [self addChildViewController:centerNC];
        
        
        leftVC.view.frame = CGRectMake(0, 0, 250, [UIScreen mainScreen].bounds.size.height);
        
//        rightVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 0, 250, [UIScreen mainScreen].bounds.size.height);
        centerNC.view.frame = [UIScreen mainScreen].bounds;
        
        
        [self.view addSubview:self.backimage];
        [self.view addSubview:leftVC.view];
//        [self.view addSubview:rightVC.view];
        [self.view addSubview:centerNC.view];
        
        centerVC.navigationItem.leftBarButtonItem = ({
            UIBarButtonItem *leftB = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
            leftB;
        });
        
        
//        centerVC.navigationItem.rightBarButtonItem = ({
//            UIBarButtonItem *rightB = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
//            rightB;
//        });
        
        
    }
    
    return self;
    
    
}


/**
 * 设置背景图片
 */
- (UIImageView *)backimage {

    if (!_backimage) {
        self.backimage = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UIImage *sourceImage = [UIImage imageNamed:@"123"];
        UIImage *lastImage = [sourceImage applyDarkEffect];
        self.backimage.image = lastImage;

        
//        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        toolBar.barStyle = UIBarStyleBlackTranslucent;
//        [self.backimage addSubview:toolBar];
        
        
    }
    return _backimage;
}












/**
 *  左边按钮事件: rightVC 和 centerNC 向右偏移
 */
- (void)leftAction:(UIBarButtonItem *)sender {
    
    UINavigationController *centerNC = self.childViewControllers.lastObject;
    RightViewController *rightVC = self.childViewControllers[1];
    LeftViewController *leftVC = self.childViewControllers.firstObject;
    [UIView animateWithDuration:0.5 animations:^{
        
 /*       if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            // iOS 7
            [self prefersStatusBarHidden];
            [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
        }
   */
        if ( centerNC.view.center.x != self.view.center.x ) {
            
            
            NSLog(@"1回来");
            leftVC.view.frame = CGRectMake(0, 0, 250, [UIScreen mainScreen].bounds.size.height);
//            rightVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 0, 250, [UIScreen mainScreen].bounds.size.height);
            centerNC.view.frame = [UIScreen mainScreen].bounds;
            _isChange = !_isChange;
            return;
        }{
            
 
        centerNC.view.frame = CGRectMake(250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        rightVC.view.frame = CGRectMake(250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
            // [[UIApplication sharedApplication]setStatusBarHidden:_isChange];
            // [self setNavigationBarHidden:_isChange animated:YES];
            
        }
    }];
        
}





/*
- (BOOL)prefersStatusBarHidden
{
      //  if (_isChange) {

                return !_isChange;//隐藏为YES，显示为NO
//        }else{
//            
//            return YES;
//        }
////
}
*/


/**
 * 右边按钮事件: leftVC 和 centerNC 向左偏移
 */
//- (void)rightAction:(UIBarButtonItem *)sender {
//    UINavigationController *centerNC = self.childViewControllers.lastObject;
//    LeftViewController *leftVC = self.childViewControllers.firstObject;
//    RightViewController *rightVC = self.childViewControllers[1];
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        if ( centerNC.view.center.x != self.view.center.x ) {
//            
//            
//            NSLog(@"1回来");
//            leftVC.view.frame = CGRectMake(0, 0, 250, [UIScreen mainScreen].bounds.size.height);
//            rightVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 0, 250, [UIScreen mainScreen].bounds.size.height);
//            centerNC.view.frame = [UIScreen mainScreen].bounds;
//           
//        }else{
//            centerNC.view.frame = CGRectMake(-250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            leftVC.view.frame =CGRectMake(-250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        }
//    }];
//    
//}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
