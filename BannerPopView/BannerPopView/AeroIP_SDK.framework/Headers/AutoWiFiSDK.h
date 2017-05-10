//
//  GetWiFiInfo.h
//  AeroIP_SDK
//
//  Created by YY on 2017/2/9.
//  Copyright © 2017年 yosemite. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/**
 网络状态

 - NetworkReachabilityStatusUnknown: 未知网络
 
 - NetworkReachabilityStatusNotReachable: 网络不可达
 
 - NetworkReachabilityStatusReachableViaWWAN: 蜂窝数据
 
 - NetworkReachabilityStatusReachableViaWiFi: Wi-Fi网络
 
 */

typedef NS_ENUM(NSInteger, NetworkReachabilityStatus) {
    NetworkReachabilityStatusUnknown          = -1,
    NetworkReachabilityStatusNotReachable     = 0,
    NetworkReachabilityStatusReachableViaWWAN = 1,
    NetworkReachabilityStatusReachableViaWiFi = 2,
};

/**
 
 @param exchangeData 交换的数据
 */
typedef void (^calculateExchangeData)(double exchangeData);

/**
 

 @param pingValue ping值
 */
typedef void (^calculatePingValue)(NSString*pingValue );

/**
 
@param status 网络状态
 */
typedef void (^queryCurrentNetworkState)(NetworkReachabilityStatus status);

/**
 

 @param coordinate 经纬度信息
 */
typedef void (^currentLocationInfo)(CLLocationCoordinate2D coordinate);

/**
 
@param seconds 时长 单位秒
 */
typedef void (^currentConnectedTimeLength)(NSTimeInterval seconds);

@interface AutoWiFiSDK : NSObject


/**
获取热点信息
 */
+(void)getWiFiHotInformation:(NSDictionary*)parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError * error))failure;


/**
上传采集的用户信息
 */
+(void)uploadCollectionOfUserInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;


/**
查询基础配置
 */
+(void)queryConfigurationInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;


/**
更新采集的数据
 */
+(void)updateCollectionInformation:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *erro))failure;



/**
 单例
 */
+(instancetype)shareWiFiInfo;


/**
 注册SDK服务  在AppDelegate里的- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions方法中注册服务
 */
-(void)registerSDKService;


/**
 当前的ssid
 */
@property (nonatomic,strong,readonly)NSString *currentSsid;


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

/**
 连接时间
 */
@property (nonatomic,assign,readonly)NSTimeInterval connectedTime;

/**
 断开时间
 */
@property (nonatomic,assign,readonly)NSTimeInterval breakedTime;

/**
 信号强度，遍历状态栏得到的，如果状态栏被隐藏，则获取不到。
 */
@property(nonatomic,assign,readonly)int signalStrength;

/**
 海拔高度
 */
@property (nonatomic,readonly,assign)double verticalAccuracy;
/**
 获得当前位置的回调
 */
-(void)currentLocation:(currentLocationInfo)locationInfo;


/**
 获得当前网络状态的回调
 */
-(void)queryCurrentNetworkState:(queryCurrentNetworkState)currentNetwokState;


/**
 获得交换数据的回调
 */
-(void)calculateExchangeData:(calculateExchangeData)calculateData;


/**
 获得ping值的回调
 */
-(void)calculatePingValue:(calculatePingValue)pingvalue;


/**
 计算连接时长的回调
 */
-(void)calculateConnectedTime:(currentConnectedTimeLength)connectedTimeLength;







@end
