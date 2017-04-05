//
//  NSObject+SFBuilder.h
//  Tronker
//
//  Created by 王声远 on 17/3/28.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Cache)

/**
 对象缓存：包括内存缓存、硬盘缓存
 缓存机制：key-value(key=对象名，value=对象jsonString)
 */
- (instancetype (^)())modelToCache;

/**
 类对象获取缓存的model
 缓存机制：key-value(key=类名，value=对象)
 */
+ (id (^)())cacheToModel;

/**
 类对象缓存的NSDictionary
 缓存机制：key-value(key=类名，value=字典)
 */
+ (NSDictionary *(^)())cacheToDict;

/**
 模型转字符串
 */
- (NSString *(^)())modelToString;

/**
 模型转字典
 */
- (NSDictionary *(^)())modelToDict;

@end
