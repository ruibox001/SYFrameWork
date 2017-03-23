//
//  NSObject+SFBaseAop.m
//  SofficeMoi
//
//  Created by 王声远 on 17/2/10.
//  Copyright © 2017年 Soffice. All rights reserved.
//

#import "NSObject+SFBaseAop.h"
#import <objc/runtime.h>

@implementation NSObject (SFBaseAop)

/**
 Aop实现基类实现方法交换，解决多个Category之间的问题和调用原方法的正常调用
 @param originalSelector 原方法
 @param newSelector 交换的实现方法
 @param mySelector  如果原方法不存在的替换实现方法
 */
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

@end
