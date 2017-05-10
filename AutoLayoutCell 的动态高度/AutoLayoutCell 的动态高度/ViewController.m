//
//  ViewController.m
//  AutoLayoutCell 的动态高度
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//
#define K_UrlString @"http://m2.qiushibaike.com/article/list/text?page=1&count=30"
#import "ViewController.h"
#import "BSHttpRequest.h"
#import "ItemsModel.h"
#import "ItemsCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadWithData];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor=[UIColor cyanColor];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"id"];
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
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
//    NSLog(@"++%@++",obj);
    NSArray *itemsArr=obj[@"items"];
    for (NSDictionary *dict in itemsArr) {
        
        ItemsModel *model=[[ItemsModel alloc]initWithDictionary:dict error:nil];
        [self.dataList addObject:model];
//        [self.dataList addObjectsFromArray:[ItemsModel arrayOfModelsFromDictionaries:itemsArr]];
//        NSLog(@"+++%@++++",self.dataList);
//         NSLog(@"---%@---",model.login);
    }
    [self.tableView reloadData];
} failure:^(NSError *error) {
    
}];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    cell.model=self.dataList[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
