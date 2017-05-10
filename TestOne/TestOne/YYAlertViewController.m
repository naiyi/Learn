//
//  YYAlertViewController.m
//  TestOne
//
//  Created by YY on 2017/5/5.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "YYAlertViewController.h"
#import "YYTableViewCell.h"
#define contentViewWidthRatio 0.76
#define contentViewWidhtHeightRatio 0.74
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define viewHeight [UIScreen mainScreen].bounds.size.height
#define viewWidth [UIScreen mainScreen].bounds.size.width

@interface YYAlertViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataList;
}
@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong)UITableView *tableview;
@property YYAlertViewController *currentObject;
@end

@implementation YYAlertViewController



-(instancetype)initWithAlertViewController{
    if (self=[super init]) {
        self.currentObject = self;
        _dataList=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
        [self setUpUI];
        [self showAlertViewControntroller];
    }
    return self;
}
-(void)setUpUI{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    self.bgView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.6];
    [self.view addSubview:self.bgView];
    CGFloat originX=(viewWidth-viewWidth*contentViewWidthRatio)/2;
    CGFloat originY=(viewHeight-viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio)/2;
    
    self.tableview=[[UITableView alloc] initWithFrame:CGRectMake(originX, originY, viewWidth*contentViewWidthRatio, viewWidth*contentViewWidthRatio/contentViewWidhtHeightRatio) style:UITableViewStyleGrouped];
    self.tableview.layer.cornerRadius=5;
    self.tableview.backgroundColor=[UIColor whiteColor];
    [self.bgView addSubview:self.tableview];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
//    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}
-(void)showAlertViewControntroller{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:5 forView:[[UIApplication sharedApplication] keyWindow] cache:YES];
        [[[UIApplication sharedApplication] keyWindow] addSubview:[self view]];
    } completion:^(BOOL finished) {
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYTableViewCell *cell=[YYTableViewCell cellWithTableView:tableView];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
