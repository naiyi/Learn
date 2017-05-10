//
//  YYVideoModel.h
//  51网易
//
//  Created by YY on 16/4/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "JSONModel.h"
@protocol YYvideoTopic;


@interface YYVideoModel : JSONModel
@property (nonatomic,copy)NSString *cover;
@property (nonatomic,copy)NSString *udescription;//映射
@property (nonatomic,assign)NSInteger length;
@property (nonatomic,copy)NSString *m3u8_url;
@property (nonatomic,copy)NSString *mp4_url;
@property (nonatomic,assign)NSInteger playCount;
@property (nonatomic,assign)NSInteger playersize;
@property (nonatomic,copy)NSString *prompt;
@property (nonatomic,copy)NSString *ptime;
@property (nonatomic,copy)NSString *replyBoard;
@property (nonatomic,copy)NSString *replyCount;
@property (nonatomic,copy)NSString *replyid;
@property (nonatomic,copy)NSString *sectiontitle;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *topicDesc;
@property (nonatomic,copy)NSString *topicImg;
@property (nonatomic,copy)NSString *topicName;
@property (nonatomic,copy)NSString *topicSid;
@property (nonatomic,copy)NSString *vid;
@property (nonatomic,copy)NSString *videosource;
@property (nonatomic,strong)NSDictionary <YYvideoTopic>*videoTopic;

@end

@interface YYvideoTopic : JSONModel
@property (nonatomic,copy)NSString *alias;
@property (nonatomic,copy)NSString *ename;
@property (nonatomic,copy)NSString *tid;
@property (nonatomic,copy)NSString *tname;
@end
