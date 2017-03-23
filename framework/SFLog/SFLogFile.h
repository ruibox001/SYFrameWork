//
//  SFLogFileManager.h
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SFLogMsg.h"

//格式化时间
#define kDateFormatDetail @"yyyy-MM-dd HH:mm:ss"
#define kDateFormatDate @"yyyy-MM-dd"

@class SFLogFile;

@protocol SFLogFormatDelegate <NSObject>
@required

- (NSString *) logFileManager:(SFLogFile *)fileManager formatLogWithMessage:(SFLogMsg *)message;

@optional

//保存几天的文件日志，默认是10天
- (NSInteger) numberOfDateNeedToHoldWithLogFileManager:(SFLogFile *)fileManager;

@end

@interface SFLogFile : NSObject

@property (assign, nonatomic) id<SFLogFormatDelegate> delegate;

+ (instancetype)sharedInstance;

/**
 操作message对象
 @param message 打印的message对象
 */
- (void)logFileWithMessage:(SFLogMsg *)message;

/**
 格式化类
 @param format 时间格式
 @return 格式化当前时间后的时间字符串
 */
- (NSString *)getCurrentDate:(NSString *)format;

/**
 删除所有日志
 */
- (void)removeAllFiles;

/**
 读取所有日志文件路径
 @return 返回所有日志文件路径
 */
- (NSArray *)readAllFiles;

/**
 获取日志文件保存路径
 
 @return 文件路径
 */
- (NSString *)getLogFilePath;

@end
