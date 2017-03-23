////
////  UIResponder+SFAppBackgroupView.m
////  SofficeMoi
////
////  Created by wangshengyuan on 17/2/8.
////  Copyright © 2017年 Soffice. All rights reserved.
////

#import "AppDelegate+SFLog.h"
#import "NSObject+SFBaseAop.h"
#import "SFLogHeader.h"

@implementation AppDelegate (SFLog)

//默认创建类别时自动调用
+ (void)load {
    [self exchangeInstanceMethodWithOriginSel:@selector(applicationDidEnterBackground:) nSel:@selector(log_applicationDidEnterBackground:) mySel:@selector(mylog_applicationDidEnterBackground:)];
    [self exchangeInstanceMethodWithOriginSel:@selector(applicationWillEnterForeground:) nSel:@selector(log_applicationWillEnterForeground:) mySel:@selector(mylog_applicationWillEnterForeground:)];
}

//自定义实现该方法
- (void) mylog_applicationDidEnterBackground:(UIApplication *)application {
    [self applicationStatusIsEnter:YES];
}

//自定义替换实现该方法
- (void)log_applicationDidEnterBackground:(UIApplication *)application {
    [self applicationStatusIsEnter:YES];
    [self log_applicationDidEnterBackground:application];
}


//自定义实现该方法
- (void) mylog_applicationWillEnterForeground:(UIApplication *)application {
    [self applicationStatusIsEnter:NO];
}

//自定义替换实现该方法
- (void)log_applicationWillEnterForeground:(UIApplication *)application {
    [self applicationStatusIsEnter:NO];
    [self log_applicationWillEnterForeground:application];
}

- (void)applicationStatusIsEnter:(BOOL)enter {
    NSString *action = enter ? @"applicationDidEnterBackground" : @"applicationWillEnterForeground";
    NSString *target = NSStringFromClass([self class]);
    NSString *report = [NSString stringWithFormat:@"[%@ - %@]",target, action];
    //添加写入文件
    SFLogLevel(enter ? SFLogFlagBackgroup : SFLogFlagForeground, report);
}

@end
