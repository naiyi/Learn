//
//  ViewController.m
//  UITableViewCell
//
//  Created by yosemite on 16/9/22.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "SelectedCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tablview;
    NSArray *_dataList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tablview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tablview.delegate=self;
    _tablview.dataSource=self;
    [self.view addSubview:_tablview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedCell *cell=[tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell=[[SelectedCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tableView:didSelectRowAtIndexPath:)];
    [cell addGestureRecognizer:tap];
    cell.tag=indexPath.row;
    if (indexPath.row==0) {
        cell.paytypeImage.image=[UIImage imageNamed:@"矢量智能对象_93"];
        cell.labelText.text=@"12313";
//        if (!cell.selected) {
//             cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
//        }else{
//            cell.selectedImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
//        }
        cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
    }
    if (indexPath.row==1) {
        cell.paytypeImage.image=[UIImage imageNamed:@"矢量智能对象_93"];
        cell.labelText.text=@"qweq";
//        if (!cell.selected) {
//            cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
//        }else{
//            cell.selectedImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
//        }
        cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
    }
    if (indexPath.row==2) {
        cell.paytypeImage.image=[UIImage imageNamed:@"矢量智能对象_93"];
        cell.labelText.text=@"qwe13";
//        if (!cell.selected) {
//            cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
//        }else{
//            cell.selectedImage.image=[UIImage imageNamed:@"矢量智能对象_23"];
//        }
        cell.selectedImage.image=[UIImage imageNamed:@"椭圆-4"];
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
