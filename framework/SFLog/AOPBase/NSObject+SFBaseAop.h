//
//  NSObject+SFBaseAop.h
//  SofficeMoi
//
//  Created by 王声远 on 17/2/10.
//  Copyright © 2017年 Soffice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CustomBlock)(id obj);

@interface NSObject (SFBaseAop)

/**
 Aop实现基类实现方法交换，解决多个Category之间的问题和调用原方法的正常调用
 @param originalSelector 原方法
 @param newSelector 交换的实现方法
 @param mySelector  如果原方法不存在的替换实现方法
 */
+ (void) exchangeInstanceMethodWithOriginSel:(SEL) originalSelector nSel:(SEL) newSelector mySel:(SEL) mySelector;

@end
