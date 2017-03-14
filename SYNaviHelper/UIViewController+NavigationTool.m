//
//  UIViewController+NavigationTool.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIViewController+NavigationTool.h"
#import <objc/runtime.h>

#define WEAKSELF typeof(self) __weak weakSelf = self;

static char navigationToolKey;

@interface UIViewController()

@property (nonatomic,strong) SYNavigationTool *navigationTool;

@end

@implementation UIViewController (NavigationTool)

- (void)setNavigationTool:(SYNavigationTool *)navigationTool
{
    [self willChangeValueForKey:@"navigationToolKey"];
    objc_setAssociatedObject(self, &navigationToolKey,
                             navigationTool,
                             OBJC_ASSOCIATION_RETAIN);
    [self didChangeValueForKey:@"navigationToolKey"];
}

- (SYNavigationTool *)navigationTool
{
    return objc_getAssociatedObject(self, &navigationToolKey);
}

- (SYNavigationTool *)shareNavigationTool {
    if (!self.navigationTool) {
        self.navigationTool = [[SYNavigationTool alloc] init];
    }
    return self.navigationTool;
}

//添加标题
- (void)addNavigationTitle:(NSString *)title {
    [[self shareNavigationTool] addTitle:title ctl:self titleColor:nil];
}

//添加标题
- (void)addNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor{
    [[self shareNavigationTool] addTitle:title ctl:self titleColor:titleColor];
}

//添加左边
- (void)addNavigationLeft:(id)left clickBlock:(NavButtonClickBlock)block {
    [self addNavigationLeft:left tintColor:nil clickBlock:block];
}

//添加左边
- (void)addNavigationLeft:(id)left tintColor:(UIColor *)tintColor clickBlock:(NavButtonClickBlock)block {
    if (!block) {
        WEAKSELF
        block = ^() {
            [weakSelf goBack];
        };
    }
    [[self shareNavigationTool] addLeft:left ctl:self tintColor:tintColor clickBlock:block];
}

/**
 返回
 */
- (void)goBack{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

//添加右边
- (void)addNavigationRight:(id)right clickBlock:(NavButtonClickBlock)block {
    [[self shareNavigationTool] addRight:right ctl:self tintColor:nil clickBlock:block];
}

//添加右边
- (void)addNavigationRight:(id)right tintColor:(UIColor *)tintColor clickBlock:(NavButtonClickBlock)block {
    [[self shareNavigationTool] addRight:right ctl:self tintColor:tintColor clickBlock:block];
}


@end
