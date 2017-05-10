//
//  ViewController.m
//  plist文件生成
//
//  Created by yosemite on 16/9/23.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSArray *name = [[NSArray alloc]initWithObjects:@"A",@"Bonkers",@"carolingia",@"catholicschoolgirls",@"Chubsy",@"devroye",@"donreesclaws",@"feenacasual",@"Flakes",@"Gangster",@"gothic_ultra_ot",@"Howardson",@"Husser",@"JustOldFashion",@"Kells_SD",@"Kensinton",@"Kookazoo",@"littlelordfontleroy",@"Mothproof_Script",@"Nuttipy",@"OldSchool",@"oliver",@"Percirk",@"readyformycloseup",@"Reginald",@"SFCollegiateSolid",@"Tangerine_Bold",@"Zainly", nil];
//
    NSArray *arr=[NSArray arrayWithObjects:@"北京",@"上海",@"郑州",@"武汉",@"呼伦贝尔",@"温州",@"无锡",@"扬州",@"杭州",@"深圳",@"广州",@"天津",@"成都",@"重庆",@"苏州",@"南京",@"西安",@"洛阳",@"青岛",@"拉萨",@"宁夏",@"昆明",@"哈尔滨",@"东莞",@"贵州",@"西宁",@"厦门",@"沈阳",@"南宁",@"长沙",@"乌鲁木齐",@"太原",@"澳门",@"香港", nil];
    NSMutableArray *all = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i = 0; i<34; i++) {
//        NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:[name objectAtIndex:i],@"font",@"hello",@"text", nil];
        NSString *item=[NSString stringWithFormat:@"Item 0"];
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:arr[i],item,nil];
        [all addObject:dict];
    }
    
// /Users/yosemite/Desktop/citys.plist
    NSString *path=[NSString stringWithFormat:@"/Users/yosemite/Desktop/citys1.plist"];
    [all writeToFile:path atomically:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
