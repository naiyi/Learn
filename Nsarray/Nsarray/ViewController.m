//
//  ViewController.m
//  Nsarray
//
//  Created by yosemite on 16/9/21.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p1=[Person personWithName:@"111"];//retainCount=1;
    Person *p2=[Person personWithName:@"222"];
    Person *p3=[Person personWithName:@"333"];
    NSLog(@"--p1 %lu--",[p1 retainCount]);
    NSLog(@"--p2 %lu--",[p2 retainCount]);
    NSLog(@"--p3 %lu--",[p3 retainCount]);
    NSArray *arr=[NSArray arrayWithObjects:p1,p2,p3, nil];//retainCount=2;
    NSLog(@"--arr %lu--",[arr retainCount]);
    NSLog(@"+++p1 %lu+++",(unsigned long)[arr[0] retainCount]);
    NSLog(@"+++p2 %lu+++",(unsigned long)[arr[1] retainCount]);
    NSLog(@"+++p3 %lu+++",(unsigned long)[arr[2] retainCount]);
//    NSHashTable类似NSArray
    NSHashTable *arr2=[NSHashTable hashTableWithOptions:NSHashTableWeakMemory];//NSHashTableWeakMemory不对加入容器的对象引用计数器进行修改。这样可以防止循环包含，造成内存泄漏
    [arr2 addObject:p1];
    [arr2 addObject:p2];
    NSLog(@"--p111 %lu--",[p1 retainCount]);
    NSLog(@"--p222 %lu--",[p2 retainCount]);
    
//    NSMapTable类似NSDictionary
    NSMapTable *map=[NSMapTable mapTableWithKeyOptions:NSHashTableStrongMemory valueOptions:NSPointerFunctionsStrongMemory];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
