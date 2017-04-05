////
////  UIResponder+SFAppBackgroupView.m
////  SofficeMoi
////
////  Created by wangshengyuan on 17/2/8.
////  Copyright © 2017年 Soffice. All rights reserved.
////

#import "AppDelegate+Socket.h"
#import <objc/runtime.h>
#import "TcpSocket.h"

@implementation AppDelegate (Socket)

//默认创建类别时自动调用
+ (void)load {
    [self exchangeInstanceMethodWithOriginSel:@selector(applicationDidEnterBackground:) nSel:@selector(socket_applicationDidEnterBackground:) mySel:@selector(mylog_applicationDidEnterBackground:)];
    [self exchangeInstanceMethodWithOriginSel:@selector(applicationWillEnterForeground:) nSel:@selector(socket_applicationWillEnterForeground:) mySel:@selector(mylog_applicationWillEnterForeground:)];
}

//自定义实现该方法
- (void) mylog_applicationDidEnterBackground:(UIApplication *)application {
    [self applicationSocketWithEnterBackground:YES];
}

//自定义替换实现该方法
- (void)socket_applicationDidEnterBackground:(UIApplication *)application {
    [self applicationSocketWithEnterBackground:YES];
    [self socket_applicationDidEnterBackground:application];
}


//自定义实现该方法
- (void) mylog_applicationWillEnterForeground:(UIApplication *)application {
    [self applicationSocketWithEnterBackground:NO];
}

//自定义替换实现该方法
- (void)socket_applicationWillEnterForeground:(UIApplication *)application {
    [self applicationSocketWithEnterBackground:NO];
    [self socket_applicationWillEnterForeground:application];
}

+ (void) exchangeInstanceMethodWithOriginSel:(SEL)originalSelector nSel:(SEL)newSelector mySel:(SEL)customSelector {
    NSParameterAssert(originalSelector);
    NSParameterAssert(newSelector);
    NSParameterAssert(customSelector);
    Class class = [self class];
    if ([class instancesRespondToSelector:originalSelector]) {
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method newMethod = class_getInstanceMethod(class, newSelector);
        method_exchangeImplementations(originalMethod, newMethod);
    }
    else {
        Method myMethod = class_getInstanceMethod(class, customSelector);
        class_addMethod(class, originalSelector, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    }
}

- (void) applicationSocketWithEnterBackground:(BOOL)enter {
    NSLog(@"是否进入后台：%d",enter);
    if (enter) {
        if([TcpSocket shareTcpSocket].isConnected){
            [[TcpSocket shareTcpSocket] disConnect];
        }
    }
    else {
        [[TcpSocket shareTcpSocket] reConnect];
    }
}

@end
