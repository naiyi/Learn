//
//  MainViewController.m
//  LemonKit
//
//  Created by 1em0nsOft on 16/8/29.
//  Copyright © 2016年 1em0nsOft. All rights reserved.
//

#import "MainViewController.h"
#import "NSString+LK.h"
@implementation MainViewController{
    NSArray<NSString *> *_titleArray;
    NSArray<NSString *> *_segueIdentifierArray;
}

- (void)viewDidLoad{
    self->_titleArray = @[@"Custom Views" , @"Tips"];
    self->_segueIdentifierArray = @[@"ShowCustomViewsViewController" , @"ShowTipsViewController"];
//    NSString *str1=[NSString stringWithFormat:@"hello world"];
    NSString *str2=[NSString randomUUID];
    NSLog(@"++++%@+++++",str2);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self->_titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MAIN_CELL_IDENTIFIER";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier];
    }
    cell.textLabel.text = self->_titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier: self->_segueIdentifierArray[indexPath.row] sender: self];
}

@end
