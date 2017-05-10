//
//  ViewController.m
//  NSSet和NSMutableSet
//
//  Created by yosemite on 16/10/11.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    集合（NSSet）和数组（NSArray）有相似之处，都是存储不同的对象的地址；不过NSArray是有序的集合，NSSet是无序的集合。
//    集合是一种哈希表，运用散列算法，查找集合中的元素比数组速度更快，但是它没有顺序。
    NSSet *set=[NSSet setWithArray:@[@"12",@"14",@"13",@"15",@"17"]];//数组初始化
    NSLog(@">>>>%li<<<<",[set count]);
    NSSet *set1=[NSSet setWithObjects:@"111",@"123", nil];//对象初始化
    BOOL bool1=[set1 containsObject:@"111"];//包含
    if (bool1) {
        NSLog(@"+++++++++++++");
    }
    NSEnumerator *enumerator=[set1 objectEnumerator];
    for (NSObject *object in enumerator) {
        NSLog(@"set1里的对象%@",object);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
