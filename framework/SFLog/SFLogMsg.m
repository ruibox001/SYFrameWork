//
//  SFLogMsg.m
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFLogMsg.h"

@implementation SFLogMsg

+ (instancetype)shareWithMessage:(NSString *)message
                            flag:(SFLogFlag)level
                        fileName:(NSString *)fileName
                        function:(NSString *)function
                            line:(NSUInteger)line
                         console:(BOOL)console
                       timestamp:(NSDate *)timestamp{
    return [[super alloc] initWithMessage:message flag:level fileName:fileName function:function line:line console:console timestamp:timestamp];
}

- (instancetype)initWithMessage:(NSString *)message
                           flag:(SFLogFlag)level
                       fileName:(NSString *)fileName
                       function:(NSString *)function
                           line:(NSUInteger)line
                        console:(BOOL)console
                      timestamp:(NSDate *)timestamp {
    if ((self = [super init])) {
        _msgs      = [message copy];
        _level        = level;
        _fileName = fileName;
        _function     = [function copy];
        _line         = line;
             _console = console;
        _timestamp    = timestamp ?: [NSDate new];
    }
    return self;
}

- (nonnull NSString *)getLogLevelName {
    switch (_level) {
        case SFLogFlagError:
            return @"<Error>";
        case SFLogFlagWarning:
            return @"<Warning>";
        case SFLogFlagInfo:
            return @"<Info>";
        case SFLogFlagDebug:
            return @"<Debug>";
        case SFLogFlagVerbose:
            return @"<Verbose>";
        case SFLogFlagClick:
            return @"<Click>";
        case SFLogFlagPage:
            return @"<Page>";
        case SFLogFlagBackgroup:
            return @"<Backgroup>";
        case SFLogFlagForeground:
            return @"<Foreground>";
        case SFLogFlagNetwork:
            return @"<Network>";
        default:
            return @"<Custom>";
    }
}

@end
