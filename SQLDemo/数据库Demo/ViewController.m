//
//  ViewController.m
//  数据库Demo
//
//  Created by 刘亚飞 on 16/6/10.
//  Copyright © 2016年 刘亚飞. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "User.h"
#import "UserTool.h"

@interface ViewController ()<UISearchBarDelegate>
@property (nonatomic,assign) sqlite3 *db;//指针对象
@property (nonatomic,strong) NSMutableArray *userArray;
@end

@implementation ViewController
-(NSMutableArray *)userArray
{
    
    if (_userArray== nil) {
        
        _userArray = (NSMutableArray *)[UserTool users];
        
        if (_userArray == nil) {
            _userArray = [NSMutableArray array];
            
            
        }
    }
    return _userArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *bar = [[UISearchBar alloc]init];
    bar.delegate = self;
    self.navigationItem.titleView = bar;

}
#pragma mark －操作方法
- (IBAction)insert:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
[self alert:alert handler:^(UIAlertAction *action) {
    User *user = [[User alloc]init];
    user.name = [alert.textFields[0] text];
    user.age = [alert.textFields[1] text];
    user.userID = [NSString stringWithFormat:@"%u",arc4random_uniform(1000)+1000];
    [self.userArray insertObject:user atIndex:self.userArray.count];
    [self.tableView reloadData];
    
    NSString *insert = [NSString stringWithFormat:@"insert into t_user (name,age,userID) values('%@','%@','%@')",user.name,user.age,user.userID];
    [UserTool userWithSql:insert];

} text:^(UITextField *textField) {
    textField.placeholder = @"请输入姓名";

} text:^(UITextField *textField) {
    textField.placeholder = @"请输入年龄";

}];
}
-(void)alert:(UIAlertController *)alert handler:(void (^ __nullable)(UIAlertAction *action))handler text:(void (^ __nullable)(UITextField *textField))text1 text:(void (^ __nullable)(UITextField *textField))text2{
   
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:handler];
    [alert addAction:cancel];
    [alert addAction:action];
    [alert addTextFieldWithConfigurationHandler:text1];
    [alert addTextFieldWithConfigurationHandler:text2];
    [self presentViewController:alert animated:YES completion:nil];
    

}
- (IBAction)delete:(id)sender {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

#pragma mark -searchBar 代理
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.tableView setEditing:NO animated:YES];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString *select = [NSString stringWithFormat:@"select *from t_user where name like '%%%@%%' or age like '%%%@%%';",searchText,searchText];
    self.userArray = [UserTool userWithSql:select];
    [self.tableView reloadData];
}

#pragma mark - tableView 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *path = @"user";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:path];
    User *user = self.userArray[indexPath.row];
    cell.textLabel.text = user.name;
    cell.detailTextLabel.text = user.age;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    User *user = self.userArray[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self alert:alert handler:^(UIAlertAction *action) {
        
        User *userName = [[User alloc]init];
        userName.name = [alert.textFields[0] text];
        userName.age = [alert.textFields[1] text];
        [self.userArray replaceObjectAtIndex:indexPath.row withObject:userName];
        [self.tableView reloadData];
        NSString *update = [NSString stringWithFormat:@"update t_user set name = '%@', age = '%@' where userID = '%@'",userName.name,userName.age,user.userID];
        [UserTool userWithSql:update];

    } text:^(UITextField *textField) {
        
        textField.text = user.name;
        
    } text:^(UITextField *textField) {
        textField.text = user.age;

    }];

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    User *user = self.userArray[indexPath.row];

    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i =indexPath.row; i<self.userArray.count; i++) {
        [arr addObject:user];
        
    }
    [self.userArray removeObjectsInArray:arr];
    [self.tableView reloadData];
    NSString *insert = [NSString stringWithFormat:@"delete from t_user where userID = '%@'",user.userID];
    [UserTool userWithSql:insert];


    
}

@end
