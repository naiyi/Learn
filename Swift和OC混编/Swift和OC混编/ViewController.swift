//
//  ViewController.swift
//  Swift和OC混编
//
//  Created by yosemite on 16/10/17.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        方法 1:
//    cocotouch class创建一个类然后出现创建桥接的提示框， 点确定这后就会生成一个以<produceName-Bridging-Header.h>的头文件。在targets->build settings ->Object-C Bridging Header 设为哪个桥接的头文件即可。搜索general找到Object-C Bridging Header添加路径：项目名字／加桥接文件名     在桥接文件里#import "要导入的类名 "
//        方法 2:
//        创建一个头文件其他根方法1一样的操作
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

