//
//  SFLogMessage.m
//  Tronker
//
//  Created by 王声远 on 17/3/1.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFLog.h"
#import "SFLogFile.h"

@interface SFLog()<SFLogFormatDelegate>

@property (nonatomic,strong) NSString *currentViewController;

@end

@implementation SFLog

/**
 初始化Log类
 @return Log单利对象
 */
+ (SFLog *)shareLog {
    
    static SFLog *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SFLog alloc] init];
        [SFLogFile sharedInstance].delegate = instance;
    });
    return instance;
}


/**
 日志信息
 @param enable 是否启动前台打印
 @param level 信息级别
 @param file 文件名
 @param function 方法名
 @param line 行号
 @param format 格式化字符串
 */
+ (void)log:(BOOL)enable
      level:(SFLogFlag)level
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
     format:(NSString *)format, ...
{

    va_list args;
    
    if (format) {
        
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        
        [self log:enable
          message:message
            level:level
             file:file
         function:function
             line:line];
    }
}

/**
 日志信息
 @param enable 是否启动前台打印
 @param message 格式化字符串
 @param level 信息级别
 @param file 文件名
 @param function 方法名
 @param line 行号

 */
+ (void)log:(BOOL)enable
    message:(NSString *)message
      level:(SFLogFlag)level
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
{
    NSString *f = [NSString stringWithFormat:@"%s", file];
    NSString *p = [NSString stringWithFormat:@"%s", function];
    [[self shareLog] logs:enable message:message level:level file:f function:p line:line];
}

/**
 日志信息
 @param console 是否启动前台打印
 @param message 格式化字符串
 @param level 信息级别
 @param file 文件名
 @param function 方法名
 @param line 行号
 */
- (void)logs:(BOOL)console
    message:(NSString *)message
      level:(SFLogFlag)level
       file:(NSString *)file
   function:(NSString *)function
       line:(NSUInteger)line
{
    //界面跳转时记录那个跳到那个
    if (level == SFLogFlagPage) {
        NSString *m = message;
        message = [NSString stringWithFormat:@"%@ -> %@",self.currentViewController,message];
        self.currentViewController = m;
    }
    SFLogMsg *msg = [SFLogMsg shareWithMessage:message
                                            flag:level
                                        fileName:file
                                        function:function
                                            line:line
                                         console:console
                                       timestamp:nil];
    [[SFLogFile sharedInstance] logFileWithMessage:msg];
}

/**
 自定义日志
 @param log 日志
 */
+ (void)customLog:(NSString *)log {
    SFLogMsg *msg = [SFLogMsg shareWithMessage:log
                                            flag:-1
                                        fileName:@"无"
                                        function:@"无"
                                            line:0
                                         console:YES
                                       timestamp:nil];
    [[SFLogFile sharedInstance] logFileWithMessage:msg];
}

/**
 实现格式化的代理
 @param message 消息对象
 @return 格式化好的消息
 */
- (NSString *) logFileManager:(SFLogFile *)fileManager formatLogWithMessage:(SFLogMsg *)message {
    NSString *formatStr = [NSString stringWithFormat:@"\n操作日志[%@]\n操作类型：%@\n文件名：%@\n方法名：%@\n行号：%lu\n详细内容：\n%@\n",
                           [fileManager getCurrentDate:kDateFormatDetail],
                           [message getLogLevelName],
                           message.fileName,
                           message.function,
                           (long)message.line,
                           message.msgs];
    return formatStr;
}

/**
 文件有效期为几天
 @param fileManager 文件操作类
 @return 文件有效期天数
 */
- (NSInteger)numberOfDateNeedToHoldWithLogFileManager:(SFLogFile *)fileManager {
    return 10;
}

/**
 删除所有日志文件
 */
+ (void)removeAllFileLogs {
    [[SFLogFile sharedInstance] removeAllFiles];
}

/**
 读取所有文件
 @return 所有文件路径
 */
+ (NSArray *)readAllFiles {
    return [[SFLogFile sharedInstance] readAllFiles];
}

/**
 格式化当前时间
 @param format 格式化格式
 @return 当前时间格式好的字符串
 */
+ (NSString *)getCurrentDateWithFormat:(NSString *)format{
    return [[SFLogFile sharedInstance] getCurrentDate:format];
}

@end
