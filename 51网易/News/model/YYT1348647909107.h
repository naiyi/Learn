//
//  YYT1348647909107.h
//  51网易
//
//  Created by YY on 16/4/25.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "JSONModel.h"
@protocol YYT1348647909107;
@protocol YYads;
@protocol YYimgextra;

@interface YYMain : JSONModel
@property (nonatomic,retain)NSArray<YYT1348647909107> *T1348647909107;
@end
@interface YYT1348647909107 : JSONModel
@property (nonatomic,retain)NSArray <YYads>*ads;
@property (nonatomic,copy)  NSString *alias;
@property (nonatomic,copy)NSString *boardid;
@property (nonatomic,copy)NSString *cid;
@property (nonatomic,copy)NSString *digest;

@property (nonatomic,copy)NSString *docid;
@property (nonatomic,copy)NSString *ename;
@property (nonatomic,assign)NSInteger hasAD;
@property (nonatomic,copy)NSString *hsaCover;
@property (nonatomic,assign)NSInteger hasHead;
@property (nonatomic,copy)NSString *hasIcon;
@property (nonatomic,assign)NSInteger hasImage;
@property (nonatomic,strong)NSArray <YYimgextra>*imgextra;
@property (nonatomic,copy)NSString *imgsrc;
@property (nonatomic,copy)NSString *imodify;
@property (nonatomic,assign)NSInteger order;
@property (nonatomic,copy)NSString *photosetID;
@property (nonatomic,copy)NSString *postid;
@property (nonatomic,assign)NSInteger priority;
@property (nonatomic,copy)NSString *ptime;
@property (nonatomic,assign)NSInteger replayCount;
@property (nonatomic,copy)NSString* skipID;
@property (nonatomic,copy)NSString *source;
@property (nonatomic,copy)NSString *utemplate;//映射
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *tname;
@property (nonatomic,assign)NSInteger votecount;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *ltitle;
@end

@interface YYads : JSONModel
@property (nonatomic,copy)NSString *imgsrc;
@property (nonatomic,copy)NSString*subtitle;
@property (nonatomic,copy)NSString *tag;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *url;
@end


@interface YYimgextra : JSONModel
@property (nonatomic,copy)NSString *imgsrc;
@end








