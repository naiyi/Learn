//
//  SnapWiFiSDK.h
//  SnapWiFi_SDK
//
//  Created by YY on 2017/4/11.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SnapWiFiManager [SnapWiFiSDK shareWiFiInfo]
/**
 @param exchangeData 交换的数据
 */
typedef void (^calculateExchangeData)(double exchangeData);


/**
@param pingValue ping值
 */
typedef void (^calculatePingValue)(NSString*pingValue );


typedef void (^calculatePingvalueAndConnectDateAndExchangeData)(NSTimeInterval connectTime,double data,NSTimeInterval breakTime);
@interface SnapWiFiSDK : NSObject

/**
 获取热点信息
 */
-(void)getWiFiHotInformation:(NSDictionary*)parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError * error))failure;


/**
 上传采集的用户信息
 */
-(void)uploadCollectionOfUserInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;


/**
 查询基础配置
 */
-(void)queryConfigurationInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;


/**
 更新采集的数据
 */
-(void)updateCollectionInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;



/**
 单例
 */
+(instancetype)shareWiFiInfo;


/**
 注册SDK服务  在AppDelegate里的- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions方法中注册服务
 */
-(void)registerSDKServiceWithKey:(NSString *)appkey;


//将带密码的data转成string
- (NSString*)decryptAESString:(NSString*)string;

/**
 当前的ssid
 */
@property (nonatomic,strong,readonly)NSString *currentSsid;


/**
 当前的Bssid
 */
@property (nonatomic,strong,readonly)NSString *currentBssid;


/**
 系统版本
 */
@property (nonatomic,strong,readonly)NSString *sysversion;
/**
 设备名
 */
@property (nonatomic,strong,readonly)NSString *deviceName;


/**
 设备号(uuid)
 */
@property (nonatomic,strong,readonly)NSString *deviceNumber;


/**
 国家
 */
@property (nonatomic,strong,readonly)NSString *country;


/**
 语言
 */
@property (nonatomic,strong,readonly)NSString *language;

//获得IP地址
@property (nonatomic,copy,readonly)NSString *ipAddress;

/**
 获得交换数据的回调
 */

-(void)calculateExchangeData:(calculateExchangeData)calculateData;

/**
 获得ping值的回调
 */
-(void)calculatePingValue:(calculatePingValue)pingvalue;



-(void)calculateData:(calculatePingvalueAndConnectDateAndExchangeData) callBack;







@end
