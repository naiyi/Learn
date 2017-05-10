//
//  YYFourViewController.m
//  51网易
//
//  Created by YY on 16/4/22.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "YYFourViewController.h"
#import "HttpRequest.h"
#import "YYT1348647909107.h"
#import "YYT1348647909107Cell.h"
#import "WebViewController.h"
#import "BSHttpRequest.h"
#import "MJRefresh.h"
#define k_urlstring @"http://c.3g.163.com/nc/article/list/T1444270454635/0-20.html"

@interface YYFourViewController ()
{
    NSString *_path;
}
@property (nonatomic,strong)NSMutableArray *dataList;

@end

@implementation YYFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _path=[NSString stringWithFormat:@"%@/Documents/personData.txt",NSHomeDirectory()];
   self.tableView.showsVerticalScrollIndicator=NO;
    [self.tableView registerClass:[YYT1348647909107Cell class] forCellReuseIdentifier:@"ID"];
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
    [BSHttpRequest GET:k_urlstring parameters:nil success:^(id responseObject) {
        [self.tableView.mj_header endRefreshing];
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.dataList removeAllObjects];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSMutableArray *list =obj[@"T1444270454635"];
            for (NSDictionary *dict in list) {
                YYT1348647909107 *model=[[YYT1348647909107 alloc]initWithDictionary:dict error:nil];
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
    NSString *urlstring=[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1444270454635/%li-20.html",i];
    [BSHttpRequest GET:urlstring parameters:nil success:^(id responseObject) {
        [self.tableView.mj_footer endRefreshing];
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *list =obj[@"T1444270454635"];
        for (NSDictionary *dict in list) {
            YYT1348647909107 *model = [[YYT1348647909107 alloc]initWithDictionary:dict error:nil];
            [self.dataList addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
}

-(void)loadWithData
{
[HttpRequest httpGetData:k_urlstring parameters:nil success:^(NSData *receiceData) {
    id obj=[NSJSONSerialization JSONObjectWithData:receiceData options:NSJSONReadingMutableContainers error:nil];
   
    NSArray *T1348647909107 = [obj objectForKey:@"T1444270454635"];
   
    for (NSDictionary *dict in T1348647909107) {
        
        
        YYT1348647909107 *model=[[YYT1348647909107 alloc]initWithDictionary:dict error:nil];
        
        [self.dataList addObject:model];
    }
    BOOL ret = [NSKeyedArchiver archiveRootObject:_dataList toFile:_path];
    if (ret) {
        NSLog(@"文件归档成功");
    }
    else
    {
        NSLog(@"文件归档失败");
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
    YYT1348647909107Cell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    cell.T1348647909107=self.dataList[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    // Dispose of any resources that can be recreated.
}



@end
