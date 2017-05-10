//
//  YYTwoViewController.m
//  51网易
//
//  Created by YY on 16/4/22.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYTwoViewController.h"
#import "YYT1348647909107.h"
#import "YYT1348647909107Cell.h"
#import "HttpRequest.h"
#import "WebViewController.h"
#import "MJRefresh.h"
#import "BSHttpRequest.h"
#import "YYT1348647909107CellTwo.h"
#import "YYNewsHeadView.h"
#define k_urlString @"http://c.3g.163.com/nc/article/headline/T1348647909107/20-20.html?from=toutiao&size=20"

@interface YYTwoViewController ()
{
    NSString *_path;
}
@property (nonatomic,strong)NSMutableArray *dataList;

@end

@implementation YYTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _path=[NSString stringWithFormat:@"%@/Documents/personData1.txt",NSHomeDirectory()];
    self.tableView.showsVerticalScrollIndicator=NO;
    [self.tableView registerClass:[YYT1348647909107Cell class] forCellReuseIdentifier:@"ID"];
     [self.tableView registerClass:[YYT1348647909107CellTwo class] forCellReuseIdentifier:@"uid"];
     [self addRefreshLoadMore];

    
}
-(void)setUpHeadView
{
    YYNewsHeadView *headView=[[YYNewsHeadView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    headView.arr=[self.dataList[0] ads];
    self.tableView.tableHeaderView=headView;
}
-(NSMutableArray *)dataList
{
    if (!_dataList) {
        
//        _dataList=[NSKeyedUnarchiver unarchiveObjectWithFile:_path];
        if (!_dataList) {
            _dataList=[NSMutableArray array];
        }
        
    }
    return _dataList;
}
- (void)addRefreshLoadMore
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewStatuses)];
    [header beginRefreshing];
    self.tableView.mj_header = header;
    __unsafe_unretained __typeof(self) weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreStatuses];
    }];
}
//刷新数据
- (void)loadNewStatuses
{
    [BSHttpRequest GET:k_urlString parameters:nil success:^(id responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.dataList removeAllObjects];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSMutableArray *list =obj[@"T1348647909107"];
            for (NSDictionary *dict in list) {
                YYT1348647909107 *model=[[YYT1348647909107 alloc]initWithDictionary:dict error:nil];
                [self.dataList addObject:model];
                [self setUpHeadView];
                [self.tableView reloadData];
            }
        }
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
}
//加载更多数据
- (void)loadMoreStatuses
{
    static NSInteger i;
     i+=20;
    NSString *urlstring=[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647909107/%li-20.html?from=toutiao&size=20",i];
   
    [BSHttpRequest GET:urlstring parameters:nil success:^(id responseObject) {
        [self.tableView.mj_footer endRefreshing];
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *list =obj[@"T1348647909107"];
        for (NSDictionary *dict in list) {
            YYT1348647909107 *model = [[YYT1348647909107 alloc]initWithDictionary:dict error:nil];
            [self.dataList addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYT1348647909107 *model=self.dataList[indexPath.row];
    if ([model.boardid isEqualToString:@"photoview_bbs"]) {
        
        YYT1348647909107CellTwo *cell=[tableView dequeueReusableCellWithIdentifier:@"uid"];
        cell.T1348647909107=self.dataList[indexPath.row];
        
        return cell;
    }
    else{
        YYT1348647909107Cell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
        
        
        cell.T1348647909107=self.dataList[indexPath.row];
        
        return cell;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYT1348647909107 *model=self.dataList[indexPath.row];
    if ([model.boardid isEqualToString:@"photoview_bbs"]) {
        return 150;
    }
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYT1348647909107 *model=self.dataList[indexPath.row];
    WebViewController *webVC = [[WebViewController alloc]init];
    if (model.url!=nil) {
        webVC.url = model.url;
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
