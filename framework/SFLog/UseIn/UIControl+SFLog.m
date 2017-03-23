//
//  UIControl+ButtonReport.m
//  SofficeMoi
//
//  Created by Mac mini on 17/2/7.
//  Copyright © 2017年 Soffice. All rights reserved.
//

#import "UIControl+SFLog.h"
#import "NSObject+SFBaseAop.h"
#import "SFLogHeader.h"

@implementation UIControl (SFLog)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL logSelector = @selector(log_sendAction:to:forEvent:);
        [self exchangeInstanceMethodWithOriginSel:originalSelector nSel:logSelector mySel:logSelector];
    });
}

#pragma mark - Method Swizzling
- (void)log_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    //插入埋点代码
    [self performUserStastisticsAction:action to:target forEvent:event];
    [self log_sendAction:action to:target forEvent:event];
}

- (void)performUserStastisticsAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (!target || !action) {
        return;
    }
    
    id myController = nil;
    if ([target isKindOfClass:[UIViewController class]]) {
        myController = target;
    }
    else if ([target isKindOfClass:[UIView class]]) {
        myController = [self viewControllerWithView:target];
    }
    
    if (!myController) {
        return;
    }
    
    NSString *selName = NSStringFromSelector(action);
    NSString *targetStr = NSStringFromClass([myController class]);
    
    if (targetStr && selName) {
        NSString *report = [NSString stringWithFormat:@"[%@ - %@]",targetStr,selName];
        //写入文件日志
        SFLogLevel(SFLogFlagClick, report);
    }
}

- (UIViewController *)viewControllerWithView:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
