//
//  UIViewController+Report.m
//  SofficeMoi
//
//  Created by Mac mini on 17/2/7.
//  Copyright © 2017年 Soffice. All rights reserved.
//

#import "UIViewController+SFLog.h"
#import "NSObject+SFBaseAop.h"
#import "SFLogHeader.h"

@implementation UIViewController (SFLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(log_viewWillAppear:);
        [self exchangeInstanceMethodWithOriginSel:originalSelector nSel:swizzledSelector mySel:@selector(mylog_viewWillAppear:)];
    });
}

- (void)mylog_viewWillAppear:(BOOL)animated {
    [self addReport];
}

- (void)log_viewWillAppear:(BOOL)animated {
    [self log_viewWillAppear:animated];
    [self addReport];
}

- (void)addReport {
    
    if ([self isKindOfClass:[UINavigationController class]] ||
        [self isKindOfClass:[UITabBarController class]] ||
        [self isKindOfClass:[UIAlertController class]] ){
        return;
    }
    
    NSString *target = NSStringFromClass([self class]);
    if (!target || [target isEqualToString:@"UIInputWindowController"]) {
        return;
    }
    //添加写入文件
    SFLogLevel(SFLogFlagPage, target);
}

@end
