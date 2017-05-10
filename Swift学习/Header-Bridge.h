//
//  Header-Bridge.h
//  Swift学习
//
//  Created by YY on 16/12/16.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#ifndef Swift___Bridging_Header_h
#define Swift___Bridging_Header_h

//#import "UIImageView+WebCache.h"
#endif /* Swift___Bridging_Header_h */
//        方法 1:
//    cocotouch class创建一个类然后出现创建桥接的提示框， 点确定这后就会生成一个以<produceName-Bridging-Header.h>的头文件。在targets->build settings ->Object-C Bridging Header 设为哪个桥接的头文件即可。搜索general找到Object-C Bridging Header添加路径：项目名字／加桥接文件名     在桥接文件里#import "要导入的类名 "

//        方法 2:
//        创建一个头文件其他根方法1一样的操作
