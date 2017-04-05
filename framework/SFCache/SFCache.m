//
//  SYCache.m
//  Simei
//
//  Created by 王声远 on 16/4/18.
//  Copyright © 2016年 创美汇. All rights reserved.
//

#import "SFCache.h"
#import "YYCache.h"
#import <CommonCrypto/CommonDigest.h>

#define PathDire @"com.tronker.resource"

@implementation SFCache

+ (void)sf_cacheObject:(id<NSCoding>)obje forKey:(NSString *)key {
    YYCache *cache = [[YYCache alloc] initWithPath:[SFCache cachePath]];
    if ([cache containsObjectForKey:key]) {
        [cache removeObjectForKey:key];
    }
    [cache setObject:obje forKey:key];
}

+ (id)sf_cacheObjectForKey:(NSString *)key {
    YYCache *cache = [[YYCache alloc] initWithPath:[SFCache cachePath]];
    if ([cache containsObjectForKey:key]) {
        return [cache objectForKey:key];
    }
    return nil;
}

+ (NSUInteger)cacheSize {
    YYCache *cache = [[YYCache alloc] initWithPath:[SFCache cachePath]];
    return [cache.diskCache totalCost];
}

+ (void)removeAllCache {
    YYCache *cache = [[YYCache alloc] initWithPath:[SFCache cachePath]];
    [cache removeAllObjects];
}

+ (NSString *)cachePath {
    static NSString *paths = nil;
    if (!paths) {
        NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        paths=[[path objectAtIndex:0] stringByAppendingPathComponent:PathDire];
    }
    return paths;
}

+ (void)saveInt:(int)value forKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:@(value) forKey:key];
}

+ (int)readIntForKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:key] intValue];
}

+ (void)saveInteger:(NSInteger)value forKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:@(value) forKey:key];
}

+ (NSInteger)readIntegerForKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:key] integerValue];
}

+ (void)saveString:(NSString *)value forKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
}

+ (NSString *)readStringForKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (void)saveFloat:(CGFloat)value forKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:@(value) forKey:key];
}

+ (CGFloat)readFloatForKey:(NSString *)key {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:key] floatValue];
}

@end
