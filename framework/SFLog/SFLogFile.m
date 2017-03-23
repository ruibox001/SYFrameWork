//
//  SFLogFile.m
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFLogFile.h"
#import "SFLogHeader.h"
#import "FCFileManager.h"

//Log目录
#define kSFLogDirectory @"SFlog"

//最大执行数量
#define LOG_MAX_QUEUE_SIZE 100

//默认保持10天日志
#define LOG_MAX_DATE 10

@interface SFLogFile()

@property (strong, nonatomic) NSString *logFilePath;
@property (strong, nonatomic) NSFileHandle *HandleFile;

@end

@implementation SFLogFile

//定义数据操作的队列
static dispatch_queue_t _loggingQueue;

//定义操作锁
static dispatch_semaphore_t _queueSemaphore;

+ (instancetype)sharedInstance {
    static SFLogFile *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance createFile];
        [sharedInstance removeTheFileOfFireDate];
    });
    
    return sharedInstance;
}

+ (void)initialize {
    static dispatch_once_t DDLogOnceToken;
    dispatch_once(&DDLogOnceToken, ^{
        _loggingQueue = dispatch_queue_create("SF.filelog", DISPATCH_QUEUE_SERIAL);
        _queueSemaphore = dispatch_semaphore_create(LOG_MAX_QUEUE_SIZE);
        
    });
}

/**
 操作message对象
 @param message 打印的message对象
 */
- (void)logFileWithMessage:(SFLogMsg *)message {
    dispatch_semaphore_wait(_queueSemaphore, DISPATCH_TIME_FOREVER);
    dispatch_block_t logBlock = ^{
        @autoreleasepool {
            [self handleFileWithMsg:message];
        }
    };
    dispatch_sync(_loggingQueue, logBlock);
}

- (void)handleFileWithMsg:(SFLogMsg *)msg {
    
    //处理消息
    NSAssert(self.delegate,@"必须有人代理SFLogFormatDelegate");
    //没有实现方法
    NSAssert([self.delegate respondsToSelector:@selector(logFileManager:formatLogWithMessage:)], @"必须实现的formatLogWithMessage:格式化写入的字符串");
    
    NSString *str = [self.delegate logFileManager:self formatLogWithMessage:msg];
    if (msg.console) {
        SFDebugLog(@"%@",str);
    }
    [self writefile:str];
    dispatch_semaphore_signal(_queueSemaphore);
}

/**
 创建目录及文件
 */
- (void)createFile {
    if (![FCFileManager isFileItemAtPath:self.logFilePath]) {
        [FCFileManager createFileAtPath:self.logFilePath error:nil];
        NSString *str = [NSString stringWithFormat:@"日志开始\n"];
        [str writeToFile:self.logFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

/**
 追加写入数据
 @param string 需要追加写入的日志
 */
- (void)writefile:(NSString *)string
{
    [self.HandleFile seekToEndOfFile];
    NSData* stringData  = [string dataUsingEncoding:NSUTF8StringEncoding];
    [self.HandleFile writeData:stringData];
    //    [self.HandleFile closeFile];
}

/**
 格式化日志
 @param format 格式化
 @return 格式化的字符串
 */
- (NSString *)getCurrentDate:(NSString *)format {
    [SFLogFile formater].dateFormat = format;
    return [[SFLogFile formater] stringFromDate:[NSDate new]];
}

/**
 格式化日志
 @param format 格式化
 @return 格式化的字符串
 */
- (NSString *)getDateFromDate:(NSDate *)date format:(NSString *)format {
    [SFLogFile formater].dateFormat = format;
    return [[SFLogFile formater] stringFromDate:date];
}

/**
 懒加载文件路径
 @return 懒加载文件路径
 */
- (NSString *)logFilePath {
    if (!_logFilePath) {
        NSString *logPath = [NSString stringWithFormat:@"%@/%@",[FCFileManager pathForDocumentsDirectory],kSFLogDirectory];
        NSString *fileName = [NSString stringWithFormat:@"%@.txt",[self getCurrentDate:kDateFormatDate]];
        _logFilePath = [NSString stringWithFormat:@"%@/%@",logPath,fileName];
    }
    return _logFilePath;
}


/**
 获取日志文件保存路径

 @return 文件路径
 */
- (NSString *)getLogFilePath
{
    return self.logFilePath;
}

/**
 懒加载文件操作类
 @return 懒加载文件操作类
 */
- (NSFileHandle *)HandleFile {
    if (!_HandleFile) {
        _HandleFile = [NSFileHandle fileHandleForUpdatingAtPath:self.logFilePath];
    }
    return _HandleFile;
}

/**
 懒加载格式化日期类
 @return 格式化日期类
 */
+ (NSDateFormatter *)formater {
    static NSDateFormatter *formater;
    static dispatch_once_t DDLogOnceToken;
    dispatch_once(&DDLogOnceToken, ^{
        formater = [NSDateFormatter new];
    });
    return formater;
}

/**
 删除所有日志
 */
- (void)removeAllFiles {
    NSString *logPath = [NSString stringWithFormat:@"%@/%@",[FCFileManager pathForDocumentsDirectory],kSFLogDirectory];
    [FCFileManager removeFilesInDirectoryAtPath:logPath];
    
}

/**
 读取所有日志文件路径
 @return 返回所有日志文件路径
 如下：
 (
 "/var/mobile/Containers/Data/Application/5DCBCD15-7BC6-4C74-8B16-727E860A6973/Documents/SFlog/2017-03-01.txt"
 )
 */
- (NSArray *)readAllFiles {
    NSString *logPath = [NSString stringWithFormat:@"%@/%@",[FCFileManager pathForDocumentsDirectory],kSFLogDirectory];
    return [FCFileManager listFilesInDirectoryAtPath:logPath];
}

/**
 删除过期的文件
 */
- (void)removeTheFileOfFireDate {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), _loggingQueue, ^{
        
        NSArray *filePaths = [self readAllFiles];
        if (!filePaths) {
            return;
        }
        
        NSInteger numberOfFireDate = LOG_MAX_DATE;
        if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfDateNeedToHoldWithLogFileManager:)]) {
            numberOfFireDate = [self.delegate numberOfDateNeedToHoldWithLogFileManager:[SFLogFile sharedInstance]];
        }
        
        NSDate *today = [NSDate date];
        NSDate *fireDate = [SFLogFile fromDate:today addDays:-numberOfFireDate];
        //DLog(@"过期日期：%@",[self getDateFromDate:fireDate format:kDateFormatDate]);
        
        for (NSString *filePath in filePaths) {
            
            //从路径中获得完整的文件名
            NSString * fileName = [[filePath lastPathComponent] stringByDeletingPathExtension];
            NSDate *fileDate = [SFLogFile getDateFromStringDate:fileName WithFormat:kDateFormatDate];
            if (![SFLogFile compareFirstDate:fileDate bigThanSecondDateOrSame:fireDate]) {
                //文件已过期
                [FCFileManager readFileAtPath:fileName];
            }
        }
        
    });
}

//如何计算一个日期（比如2015-06-03）加上天数等于另一个日期
+ (NSDate *)fromDate:(NSString *)date format:(NSString *)format addDays:(NSInteger)addDays
{
    [[SFLogFile formater] setDateFormat:format];
    NSDate *myDate = [[SFLogFile formater] dateFromString:date];
    NSDate *newDate = [myDate dateByAddingTimeInterval:60 * 60 * 24 * addDays];
    return newDate;
}

//如何计算一个日期（比如2015-06-03）加上天数等于另一个日期
+ (NSDate *)fromDate:(NSDate *)myDate addDays:(NSInteger)addDays
{
    return [myDate dateByAddingTimeInterval:60 * 60 * 24 * addDays];
}

+ (NSDate *)getDateFromStringDate:(NSString *)date WithFormat:(NSString *)format {
    [[SFLogFile formater] setDateFormat:format];
    return [[SFLogFile formater] dateFromString:date];
}

//两个时间比较：First是否比Second大(比较格式为@"yyyy-MM-dd")
+ (BOOL)dateCompareFirstDate:(NSString *)firstDate bigThanSecondOrSame:(NSString *)secondDate format:(NSString *)format {
    
    if (!firstDate || !secondDate) {
        return NO;
    }
    
    [[SFLogFile formater] setDateFormat:format];
    
    NSDate *f = [[SFLogFile formater] dateFromString:firstDate];
    NSDate *s = [[SFLogFile formater] dateFromString:secondDate];
    
    NSTimeInterval ms = [f timeIntervalSinceDate:s];
    if (ms >= 0) {
        return YES;
    }
    return NO;
}

//两个时间比较：First是否比Second大(比较格式为@"yyyy-MM-dd")
+ (BOOL)compareFirstDate:(NSDate *)firstDate bigThanSecondDateOrSame:(NSDate *)secondDate {
    if (!firstDate || !secondDate) {
        return NO;
    }
    NSTimeInterval ms = [firstDate timeIntervalSinceDate:secondDate];
    if (ms >= 0) {
        return YES;
    }
    return NO;
}

/**
 测量手机空间使用
 */
- (void)checkPhoneDiskSpace {
    NSString* path =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSFileManager*fileManager= [[NSFileManager alloc]init];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace=[fileSysAttributes objectForKey:NSFileSystemFreeSize];
    NSNumber *totalSpace=[fileSysAttributes objectForKey:NSFileSystemSize];
    NSString *text=[NSString stringWithFormat:@"总大小:%0.2fBM/已占用%0.2fBM/剩余%0.2fBM",[totalSpace longLongValue]/1024.0/1024.0,([totalSpace longLongValue]-[freeSpace longLongValue])/1024.0/1024.0,[freeSpace longLongValue]/1024.0/1024.0];
    SFDebugLog(@"空间信息：%@",text);
}

- (void)dealloc {
    [self.HandleFile closeFile];
}

@end
