//
//  SYCache.h
//  Simei
//
//  Created by 王声远 on 16/4/18.
//  Copyright © 2016年 创美汇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFCache : NSObject

/**
 缓存大小
 @return 缓存的大小
 */
+ (NSUInteger)cacheSize;

/**
 清除所有缓存
 */
+ (void)removeAllCache;

/**
 缓存路径
 @return 缓存路径
 */
+ (NSString *)cachePath;

/**
 设置缓存：通过YYCache实现
 @param obje 缓存
 @param key key
 */
+ (void)sf_cacheObject:(id<NSCoding>)obje forKey:(NSString *)key;

/**
 获取缓存
 @param key key
 @return 返回
 */
+ (id)sf_cacheObjectForKey:(NSString *)key;

/**
 保存Int
 @param value Int数据
 @param key key
 */
+ (void)saveInt:(int)value forKey:(NSString *)key;

/**
 读取Int数据
 @param key key
 */
+ (int)readIntForKey:(NSString *)key;

/**
 保存Integer
 @param value Integer数据
 @param key key
 */
+ (void)saveInteger:(NSInteger)value forKey:(NSString *)key;

/**
 读取Integer数据
 @param key key
 */
+ (NSInteger)readIntegerForKey:(NSString *)key;

/**
 保存字符串
 @param value 字符串数据
 @param key key
 */
+ (void)saveString:(NSString *)value forKey:(NSString *)key;

/**
 读取字符串数据
 @param key key
 */
+ (NSString *)readStringForKey:(NSString *)key;

/**
 保存Float
 @param value CGFloat数据
 @param key key
 */
+ (void)saveFloat:(CGFloat)value forKey:(NSString *)key;

/**
 读取CGFloat数据
 @param key key
 */
+ (CGFloat)readFloatForKey:(NSString *)key;

@end
