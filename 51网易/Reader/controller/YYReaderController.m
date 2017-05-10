//
//  YYReaderController.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYReaderController.h"
#import "BSHttpRequest.h"
#import "YYReaderModel.h"
#import "YYReaderCell.h"
#import "YYReaderWebController.h"
#import "MJRefresh.h"
#define K_Url_String @"http://c.3g.163.com/nc/article/list/T1349837670307/0-20.html"
@interface YYReaderController ()
@property (nonatomic,strong)NSMutableArray *dataList;
@end
@implementation YYReaderController
- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title=@"论坛";
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.showsVerticalScrollIndicator=NO;
    [self.tableView registerClass:[YYReaderCell class] forCellReuseIdentifier:@"ID"];
    [self addRefreshLoadMore];
}
-(NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList=[NSMutableArray array];
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
    [BSHttpRequest GET:K_Url_String parameters:nil success:^(id responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.dataList removeAllObjects];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSMutableArray *list =obj[@"T1349837670307"];
            for (NSDictionary *dict in list) {
                YYReaderModel *model=[[YYReaderModel alloc]initWithDictionary:dict error:nil];
                [self.dataList addObject:model];
               
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
    NSString *urlstring=[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1349837670307/%li-20.html",i];
    [BSHttpRequest GET:urlstring parameters:nil success:^(id responseObject) {
        [self.tableView.mj_footer endRefreshing];
        
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *list =obj[@"T1349837670307"];
        for (NSDictionary *dict in list) {
            YYReaderModel *model = [[YYReaderModel alloc]initWithDictionary:dict error:nil];
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
    YYReaderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    cell.readerModel=self.dataList[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYReaderModel *model=self.dataList[indexPath.row];
    YYReaderWebController *webVC=[[YYReaderWebController alloc]init];
    webVC.url = model.url;
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
