//
//  ViewController.m
//  UI3_UItableViewCell自定义
//
//  Created by zhangxueming on 16/3/17.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "BookModel.h"
#import "BookTableViewCell.h"
#import "AdTableViewCell.h"
#import "AdModel.h" 

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)NSMutableArray *dataList;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,retain)NSMutableArray *adList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[BookTableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.tableView registerClass:[AdTableViewCell class] forCellReuseIdentifier:@"adCell"];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (NSMutableArray *)adList
{
    if (!_adList) {
        _adList = [NSMutableArray array];
        for (NSInteger i=0; i<4; i++) {
            AdModel *model = [[AdModel alloc] init];
            model.title = [NSString stringWithFormat:@"第%li张图片",i];
            model.picName = [NSString stringWithFormat:@"image%li",i];
            [_adList addObject:model];
        }
    }
    return _adList;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"bookData" ofType:@"plist"];
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dataArray) {
            BookModel *model = [[BookModel alloc] init];
            model.title = dict[@"title"];
            model.icon  = dict[@"icon"];
            model.price = dict[@"price"];
            model.detail = dict[@"detail"];
            [_dataList addObject:model];
        }
    }
    return _dataList;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row>0) {
        BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
        cell.dataModel = self.dataList[indexPath.row-1];
        return cell;
    }
    else
    {
        AdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adCell"];
        cell.dataArray = self.adList;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 150;
    }
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
