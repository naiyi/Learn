//
//  CenterViewController.m
//  ThreeViewsText
//
//  Created by lanouhn on 16/2/29.
//  Copyright © 2016年 老三   个人微信号 hao22221111     IOS微信公众号 D了个L    欢迎关注每天推送技术文章,项目源码, IOS技术交流源码分享QQ群 544124646 大牛多多哦
//

#import "CenterViewController.h"
#import "RightViewController.h"
#import "LeftViewController.h"
@interface CenterViewController ()

{
    BOOL _isChange;
    BOOL _isH;
}

@end

@implementation CenterViewController

/**
 
 老三   个人微信号 hao22221111 欢迎交流技术  IOS微信公众号  D了个L 每天推送技术文章,项目源码, IOS技术交流源码分享QQ群 544124646 大牛多多哦
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    // 轻扫手势
    UISwipeGestureRecognizer *leftswipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftswipeGestureAction:)];
    
    // 设置清扫手势支持的方向
    leftswipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    // 添加手势
    [self.view addGestureRecognizer:leftswipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightswipeGestureAction:)];
    
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:rightSwipeGesture];
    

    
    
    
    // Do any additional setup after loading the view.
}

/**
 *  左轻扫
 */
- (void)leftswipeGestureAction:(UISwipeGestureRecognizer *)sender {
    
    UINavigationController *centerNC = self.navigationController;
    
    LeftViewController *leftVC  = self.navigationController.parentViewController.childViewControllers[0];
//    RightViewController *rightVC = self.navigationController.parentViewController.childViewControllers[1];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
        if ( centerNC.view.center.x != self.view.center.x ) {
            

            NSLog(@"1回来");
            leftVC.view.frame = CGRectMake(0, 0, 250, [UIScreen mainScreen].bounds.size.height);
//            rightVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 0, 250, [UIScreen mainScreen].bounds.size.height);
            centerNC.view.frame = [UIScreen mainScreen].bounds;
            _isChange = !_isChange;
            return;
        }else {
            
            centerNC.view.frame = CGRectMake(-250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            leftVC.view.frame =CGRectMake(-250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            NSLog(@"左边");
            
        }
    }];
}

/**
 *  右轻扫
 */
- (void)rightswipeGestureAction:(UISwipeGestureRecognizer *)sender {
    UINavigationController *centerNC = self.navigationController;
    
//    RightViewController *rightVC = self.navigationController.parentViewController.childViewControllers[1];
    
    LeftViewController *leftVC  = self.navigationController.parentViewController.childViewControllers[0];
    
    
    [UIView animateWithDuration:0.5 animations:^{
    
        
        if ( centerNC.view.center.x != self.view.center.x ) {
            
            leftVC.view.frame = CGRectMake(0, 0, 250, [UIScreen mainScreen].bounds.size.height);
//            rightVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 250, 0, 250, [UIScreen mainScreen].bounds.size.height);
            centerNC.view.frame = [UIScreen mainScreen].bounds;
            NSLog(@"3回来");
            
        }else{
            centerNC.view.frame = CGRectMake(250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            rightVC.view.frame = CGRectMake(250, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            NSLog(@"右边");

        }
    }];

}






























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
