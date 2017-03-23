//
//  SFLogMessage.h
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFLogMsg.h"

@interface SFLog : NSObject

/**
 日志信息
 @param level 信息级别
 @param file 文件名
 @param function 方法名
 @param line 行号
 @param format 格式化字符串
 */
+ (void)log:(BOOL)console
      level:(SFLogFlag)level
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
     format:(NSString *)format, ... ;


/**
 删除所有日志文件
 */
+ (void)removeAllFileLogs;

/**
 读取所有日志文件路径
 @return 返回所有日志文件路径
 如下：
 ("/var/mobile/Containers/Data/Application/5DCBCD15-7BC6-4C74-8B16-727E860A6973/Documents/SFlog/2017-03-01.txt")
 */
+ (NSArray *)readAllFiles;

/**
 格式化当前时间
 @param format 格式化格式
 @return 当前时间格式好的字符串
 */
+ (NSString *)getCurrentDateWithFormat:(NSString *)format;


@end
