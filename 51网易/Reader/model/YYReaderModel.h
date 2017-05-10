//
//  YYReaderModel.h
//  51网易
//
//  Created by YY on 16/5/4.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "JSONModel.h"

@interface YYReaderModel : JSONModel
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *imgsrc;
@property (nonatomic,copy)NSString *source;

@end
