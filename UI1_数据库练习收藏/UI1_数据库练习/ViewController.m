//
//  ViewController.m
//  UI1_数据库练习
//
//  Created by zhangxueming on 16/5/24.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "FavourateViewController.h"
#import <AFNetworking.h>
#import <MJRefresh.h>
#import "CustomViewCell.h"
#import "ItemModel.h"

#define kLoadURL @"http://m2.qiushibaike.com/article/list/suggest"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataList;
@property (nonatomic,assign)NSInteger currentPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpNavigationItems];
     NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/Items.db"];
    NSLog(@"path = %@",path);
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //[self loadNewData:kLoadURL parames:@{@"count":@30,@"page":@1}];
    _currentPage = 1;
    __unsafe_unretained __typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData:kLoadURL parames:@{@"count":@30,@"page":@1}];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        NSNumber *pageNum  = [NSNumber numberWithInteger:self.currentPage];
        [weakSelf loadMoreData:kLoadURL parames:@{@"count":@30,@"page":pageNum}];
    }];
}


#pragma mark ---Navigation---

- (UITableView *)tableView
{
    if (_tableView==nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView = tableView;
        [_tableView registerNib:[UINib nibWithNibName:@"CustomViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (NSMutableArray *)dataList
{
    if (_dataList==nil) {
        NSMutableArray *dataArray = [NSMutableArray array];
        _dataList = dataArray;
    }
    return _dataList;
}

- (void)setUpNavigationItems
{
    self.title = @"糗事百科";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的收藏" style:UIBarButtonItemStylePlain target:self action:@selector(favourateBtnClicked:)];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)favourateBtnClicked:(UIBarButtonItem *)item
{
    FavourateViewController *fvc = [[FavourateViewController alloc] init];
    [self.navigationController pushViewController:fvc animated:YES];
}

#pragma  mark ----loadData---

- (void)loadNewData:(NSString *)URLString parames:(NSDictionary *)param
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray *items = responseObject[@"items"];
            if (items) {
                [self.dataList removeAllObjects];
                [self.dataList addObjectsFromArray:[ItemModel arrayOfModelsFromDictionaries:items error:nil]];
            }
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR = %@",error.localizedDescription);
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreData:(NSString *)URLString parames:(NSDictionary *)param
{
    _currentPage++;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSArray *items = responseObject[@"items"];
            [self.dataList addObjectsFromArray:[ItemModel arrayOfModelsFromDictionaries:items error:nil]];
        }
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR = %@",error.localizedDescription);
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    }];
}



#pragma mark ---UITableViewDelegate---

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.dataModel = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消Cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FavourateViewController *fvc = [[FavourateViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:fvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
