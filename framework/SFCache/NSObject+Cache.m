//
//  NSObject+SFBuilder.m
//  Tronker
//
//  Created by 王声远 on 17/3/28.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "NSObject+Cache.h"
#import "SFCache.h"
#import "YYModel.h"

@implementation NSObject (Cache)

- (instancetype (^)())modelToCache {
    return ^(){
        NSString *json = [self yy_modelToJSONString];
        [SFCache sf_cacheObject:json forKey:NSStringFromClass([self class])];
        return self;
    };
}

+ (id (^)())cacheToModel {
    return ^(){
        id obj = [SFCache sf_cacheObjectForKey:NSStringFromClass(self)];
        return [self yy_modelWithJSON:obj];
    };
}

+ (NSDictionary *(^)())cacheToDict {
    return ^(){
        NSString *obj = [SFCache sf_cacheObjectForKey:NSStringFromClass(self)];
        if (obj) {
            NSError *err = nil;
            NSData *jsonData = [obj dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&err];
            return dic;
        }
        return [NSDictionary dictionary];
    };
}

- (NSString *(^)())modelToString {
    return ^(){
        NSString *json = [self yy_modelToJSONString];
        return json;
    };
}

- (NSDictionary *(^)())modelToDict {
    return ^(){
        NSString *json = [self yy_modelToJSONString];
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
        return dic;
    };
}

@end
