//
//  ViewController.m
//  UINavigationController
//
//  Created by YY on 16/10/27.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import <Speech/Speech.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
 // 列出所有相册智能相册
    PHFetchResult *smartAlbums=[PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    NSLog(@"11111+++++++%@+++++++",smartAlbums);
    [smartAlbums enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj==%@----idx==%lu----",obj,(unsigned long)idx);
    }];
    // 列出所有用户创建的相册
    PHFetchResult *userCollections=[PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    NSLog(@"22222+++++++%@+++++++",userCollections);
// 获取所有资源的集合，并按资源的创建时间排序
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    NSLog(@"33333+++++++%@+++++++",assetsFetchResults);
     
     */
    
    
    
}

- (IBAction)btn:(id)sender {
    NSLog(@"++++++++++");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
