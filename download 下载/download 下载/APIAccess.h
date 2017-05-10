//
//  APIAccess.h
//  download 下载
//
//  Created by yosemite on 16/10/8.
//  Copyright © 2016年 yosemite. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FUNC_CALLBACK_ARG id receiver, NSInteger requestIdentifier
#define USE_CALLBACK_ARG receiver, requestIdentifier

typedef void(^postSuccess)(NSData *);
typedef void(^postFail)(NSError *);
@interface APIAccess : NSObject

#ifdef __cplusplus
extern "C" {
#endif

    
    //    注册
    void inet_user_sign_up(NSData *jsonData, NSString *code, FUNC_CALLBACK_ARG);
    //    登录
    void inet_user_sign_in(NSString *arg_name, NSString *arg_pin, NSString *arg_uid, FUNC_CALLBACK_ARG);
    //   获取验证码
    void inet_user_authenticode(NSString *arg_number, FUNC_CALLBACK_ARG);
    //    重置密码
    void inet_user_reset_pin(NSString *arg_name, NSString *arg_pin, NSString *arg_code, FUNC_CALLBACK_ARG);
    
#ifdef __cplusplus
}
#endif

+(void)sessionPOST:(NSString *)url postPram:(id)postPram HTTPHeader:(NSDictionary *)header  Success:(postSuccess)responseobjct failer:(postFail)failerror;























@end
