//
//  NextTableViewController.m
//  UIRefreshControl
//
//  Created by yosemite on 16/10/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "NextTableViewController.h"
#import "ViewController.h"
@interface NextTableViewController ()
@property (nonatomic,strong)UIRefreshControl *refreshcontrol;
@end

@implementation NextTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIRefreshControl  系统的refreshcontrol只能做下拉刷新不能做上拉加载更多而且只能用于UITableViewController
    self.view.backgroundColor=[UIColor blackColor];
    self.refreshControl=[[UIRefreshControl alloc]init];
    self.refreshControl.tintColor=[UIColor redColor];
    self.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"正在刷新中..." attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]}];
    [self.refreshControl addTarget:self action:@selector(refreshControlClicked) forControlEvents:UIControlEventValueChanged];
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 200, 50);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@" dainji" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclicked ) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnclicked
{
    ViewController *vc=[[ViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
}
-(void)refreshControlClicked
{
    NSLog(@"+++++刷新数据+++++");
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
