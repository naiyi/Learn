//
//  ViewController.m
//  UICollectionView 瀑布流
//
//  Created by YY on 16/5/16.
//  Copyright © 2016年 YY. All rights reserved.
//
#define K_UrlString @"http://qt.qq.com/php_cgi/lol_goods/varcache_wallpaper_list.php?type=hot&page=0&num=20&plat=android&version=9695"
#import "ViewController.h"
#import "BSHttpRequest.h"
#import "WallpapersModel.h"
#import "WallpapersViewCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
@interface ViewController ()<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor cyanColor];
    [self loadWithData];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"WallpapersViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"id"];
    self.collectionView.backgroundColor=[UIColor whiteColor];
}
-(NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList=[NSMutableArray array];
    }
    return _dataList;
}
-(void)loadWithData
{
[BSHttpRequest GET:K_UrlString parameters:nil success:^(id responseObject) {

    id obj=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"---%@---",obj);
    NSArray *wallpapersArr=obj[@"wallpapers"];
    for (NSDictionary *dict in wallpapersArr) {
        WallpapersModel *model=[[WallpapersModel alloc]initWithDictionary:dict error:nil];
        [self.dataList addObject:model];

    }
    [self.collectionView reloadData];
} failure:^(NSError *error) {
    
}];
}

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout=[[CHTCollectionViewWaterfallLayout alloc]init];
//        列数
        layout.columnCount=2;
        
        layout.minimumColumnSpacing=10;
        layout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:layout];
    }
    return _collectionView;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WallpapersViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"id" forIndexPath:indexPath];
    cell.wallpapersModel=self.dataList[indexPath.item];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WallpapersModel *model=self.dataList[indexPath.item];
    CGFloat thumbH=[model.thumb_height floatValue];
    CGFloat thumbW=[model.thumb_width floatValue];
    CGFloat W=(self.collectionView.frame.size.width-30)/2;
    CGFloat H=thumbH/thumbW*W+15;
    return CGSizeMake(W, H);
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
