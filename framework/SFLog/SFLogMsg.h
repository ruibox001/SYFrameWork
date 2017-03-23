//
//  SFLogMsg.h
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, SFLogFlag){
    /**
     *  00001
     */
    SFLogFlagError      = (1 << 0),
    
    /**
     * 00010
     */
    SFLogFlagWarning    = (1 << 1),
    
    /**
     *  00100
     */
    SFLogFlagInfo       = (1 << 2),
    
    /**
     *  01000
     */
    SFLogFlagDebug      = (1 << 3),
    
    /**
     *  10000
     */
    SFLogFlagVerbose    = (1 << 4),
    
    /**
     *  100000 点击事件
     */
    SFLogFlagClick    = (1 << 5),
    
    /**
     *  1000000 界面改变
     */
    SFLogFlagPage    = (1 << 6),
    
    /**
     *  10000000 进入后台
     */
    SFLogFlagBackgroup    = (1 << 7),
    
    /**
     *  100000000 回到前台
     */
    SFLogFlagForeground    = (1 << 8),
    
    /**
     *  1000000000 请求
     */
    SFLogFlagNetwork    = (1 << 9),
};

@interface SFLogMsg : NSObject

@property (readonly, nonatomic) BOOL console;
@property (nullable, readonly, nonatomic) NSString *msgs;
@property (readonly, nonatomic) SFLogFlag level;
@property (nullable, readonly, nonatomic) NSString *fileName;
@property (nullable, readonly, nonatomic) NSString *function;
@property (readonly, nonatomic) NSUInteger line;
@property (nullable, readonly, nonatomic) NSDate *timestamp;

+ (null_unspecified instancetype)shareWithMessage:(nullable NSString *)message
                            flag:(SFLogFlag)level
                        fileName:(nullable NSString *)fileName
                        function:(nullable NSString *)function
                            line:(NSUInteger)line
                         console:(BOOL)console
                       timestamp:(nullable NSDate *)timestamp;

- (nonnull NSString *)getLogLevelName;

@end
