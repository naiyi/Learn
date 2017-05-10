//
//  WallpapersModel.h
//  UICollectionView 瀑布流
//
//  Created by YY on 16/5/17.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "JSONModel.h"

@interface WallpapersModel : JSONModel
@property (nonatomic,copy)NSString *author;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *thumb_height;
@property (nonatomic,copy)NSString *thumb_width;
@property (nonatomic,copy)NSString *thumbUrl;
@property (nonatomic,copy)NSString *url;
@end
