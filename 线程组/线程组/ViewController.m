//
//  ViewController.m
//  线程组
//
//  Created by YY on 2017/4/28.
//  Copyright © 2017年 yosemite. All rights reserved.
//

#import "ViewController.h"
#import "YYHttpRequest.h"
#define URLStr @"http://portal.snapwifi.me:8180/snapwifi/app/phone_queryHotsList"
@interface ViewController ()

@property (nonatomic,strong) dispatch_semaphore_t sema;

@property (nonatomic,strong) dispatch_group_t group;

@property (nonatomic,strong)NSDictionary *dict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dict=@{@"appkey":@"e270c8272cf4c3786da083440Da2577fip"};
    self.sema=dispatch_semaphore_create(0);
    self.group=dispatch_group_create();
    
    
//    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
//        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
//            
//        } success:^(id responseObject) {
//            dispatch_semaphore_signal(_sema);
//            NSLog(@"Request_1");
//        } failure:^(NSError *error) {
//            dispatch_semaphore_signal(_sema);
//        }];
//        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
//    });
//    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
//        
//        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
//            
//        } success:^(id responseObject) {
//            dispatch_semaphore_signal(_sema);
//            NSLog(@"Request_2");
//        } failure:^(NSError *error) {
//            dispatch_semaphore_signal(_sema);
//        }];
//        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
//    });
//    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
//        
//        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
//            
//        } success:^(id responseObject) {
//            dispatch_semaphore_signal(_sema);
//            NSLog(@"Request_3");
//        } failure:^(NSError *error) {
//            dispatch_semaphore_signal(_sema);
//        }];
//        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
//    });

    
    
    NSBlockOperation *operation1=[NSBlockOperation blockOperationWithBlock:^{
        [self request_A];
    }];
    NSBlockOperation *operation2=[NSBlockOperation blockOperationWithBlock:^{
        [self request_B];
    }];
    NSBlockOperation *operation3=[NSBlockOperation blockOperationWithBlock:^{
        [self request_C];
    }];
    [operation2 addDependency:operation1];
    [operation3 addDependency:operation2];
    NSOperationQueue *queue=[[NSOperationQueue alloc] init];
    [queue addOperations:@[operation3,operation2,operation1] waitUntilFinished:NO];
    
    dispatch_group_notify(_group, dispatch_get_main_queue(), ^{
        NSLog(@"任务均完成，刷新界面");
    });

    
}

-(void)request_A{
//    dispatch_semaphore_t sema=dispatch_semaphore_create(0);
    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
            
        } success:^(id responseObject) {
            dispatch_semaphore_signal(_sema);
            NSLog(@"Request_1");
        } failure:^(NSError *error) {
            dispatch_semaphore_signal(_sema);
        }];
        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
    });
}

-(void)request_B{
//    dispatch_semaphore_t sema=dispatch_semaphore_create(0);
    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
        
        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
            
        } success:^(id responseObject) {
            dispatch_semaphore_signal(_sema);
            NSLog(@"Request_2");
        } failure:^(NSError *error) {
            dispatch_semaphore_signal(_sema);
        }];
        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
    });
}

-(void)request_C{
//    dispatch_semaphore_t sema=dispatch_semaphore_create(0);
    dispatch_group_async(_group, dispatch_get_global_queue(0, 0), ^{
        
        [YYHttpRequest POST:URLStr parameters:_dict progress:^(NSProgress *uploadProgress) {
            
        } success:^(id responseObject) {
            dispatch_semaphore_signal(_sema);
            NSLog(@"Request_3");
        } failure:^(NSError *error) {
            dispatch_semaphore_signal(_sema);
        }];
        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
