//
//  SFLogHeader.h
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#ifndef SFLogHeader_h
#define SFLogHeader_h

#import "SFLog.h"

#ifdef DEBUG
    #define SFLOG_ENABEL YES
#else
    #define SFLOG_ENABEL NO
#endif

#define SFLogError(frmt, ...) SFMessageLog(SFLogFlagError, frmt, ##__VA_ARGS__)
#define SFLogWarning(frmt, ...) SFMessageLog(SFLogFlagWarning, frmt, ##__VA_ARGS__)
#define SFLogInfo(frmt, ...) SFMessageLog(SFLogFlagInfo, frmt, ##__VA_ARGS__)
#define SFLogDebug(frmt, ...) SFMessageLog(SFLogFlagDebug, frmt, ##__VA_ARGS__)
#define SFLogVerbose(frmt, ...) SFMessageLog(SFLogFlagVerbose, frmt, ##__VA_ARGS__)

#define SFLogLevel(level, frmt, ...) SFMessageLog(level, frmt, ##__VA_ARGS__)

#define FILEString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define SFDebugLog(...) printf("%s 第%d行: %s\n", [FILEString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);

#define  SFMessageLog(vel, frmt, ...)                      \
do {                                                        \
        [SFLog log:SFLOG_ENABEL                            \
              level:vel                                     \
               file:[FILEString UTF8String]                 \
           function:__PRETTY_FUNCTION__                     \
               line:__LINE__ format:frmt,##__VA_ARGS__];   } while(0)

#endif /* SFLogHeader_h */
