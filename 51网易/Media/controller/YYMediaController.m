//
//  YYMediaController.m
//  51网易
//
//  Created by YY on 16/4/16.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYMediaController.h"

#import "YYVideosCell.h"
#define k_url_string @"http://c.3g.163.com/recommend/getChanListNews?channel=T1457068979049&size=10"
#import "YYVideoModel.h"
#import "HttpRequest.h"
#import "YYWebVideoController.h"
#import "MJRefresh.h"
#import "BSHttpRequest.h"
@interface YYMediaController ()
@property (nonatomic,strong)NSMutableArray *dataList;
@end

@implementation YYMediaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    self.navigationItem.title=@"精彩视频";
    self.tableView.showsVerticalScrollIndicator=NO;
    [self.tableView registerClass:[YYVideosCell class] forCellReuseIdentifier:@"ID"];
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
    [BSHttpRequest GET:k_url_string parameters:nil success:^(id responseObject) {
        
        [self.tableView.mj_header endRefreshing];
        
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSMutableArray *list =obj[@"视频"];
            for (NSDictionary *dict in list) {
                YYVideoModel *model=[[YYVideoModel alloc]initWithDictionary:dict error:nil];
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
    [BSHttpRequest GET:k_url_string parameters:nil success:^(id responseObject) {
        [self.tableView.mj_footer endRefreshing];
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *list =obj[@"视频"];
        for (NSDictionary *dict in list) {
            YYVideoModel *model = [[YYVideoModel alloc]initWithDictionary:dict error:nil];
            [self.dataList addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
}

-(void)downLoadData
{
    [HttpRequest httpGetData:k_url_string parameters:nil success:^(NSData *receiceData) {
    id obj=[NSJSONSerialization JSONObjectWithData:receiceData options:NSJSONReadingMutableContainers error:nil];

        NSArray *videoArr=[obj objectForKey:@"视频"];
        for (NSDictionary *dict in videoArr) {
            YYVideoModel *model=[[YYVideoModel alloc]initWithDictionary:dict error:nil];
            [self.dataList addObject:model];
        }
        
        [self.tableView reloadData];
}];
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    YYVideosCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
   
    cell.videoModel=self.dataList[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYVideoModel *model=self.dataList[indexPath.row];
    YYWebVideoController *webView=[[YYWebVideoController alloc]init];
    webView.url=model.mp4_url;
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


@end
