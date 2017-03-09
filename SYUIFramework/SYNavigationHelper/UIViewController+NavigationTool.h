//
//  UIViewController+NavigationTool.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYNavigationTool.h"

@interface UIViewController (NavigationTool)

//添加标题
- (void)addNavigationTitle:(NSString *)title;
- (void)addNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor;

/**
 添加左边按钮
 @param left 导航栏左边的信息，可以是UIImage/NSString
 @param block 点击回调，传入nil则自动处理返回事件
 */
- (void)addNavigationLeft:(id)left clickBlock:(NavButtonClickBlock)block;

/**
 添加左边按钮
 @param left 导航栏左边的信息，可以是UIImage/NSString
 @param tintColor 当left=NSString时有效，为字体颜色值
 @param block 点击回调，传入nil则自动处理返回事件
 */
- (void)addNavigationLeft:(id)left tintColor:(UIColor *)tintColor clickBlock:(NavButtonClickBlock)block;

/**
 返回
 */
- (void)goBack;

/**
 添加右边按钮
 @param right 导航栏右边的信息，可以是UIImage/NSString
 @param block 点击回调，传入nil时不处理
 */
- (void)addNavigationRight:(id)right clickBlock:(NavButtonClickBlock)block;

/**
 添加右边按钮
 @param right 导航栏右边的信息，可以是UIImage/NSString
 @param tintColor 当left=NSString时有效，为字体颜色值
 @param block 点击回调，传入nil时不处理
 */
- (void)addNavigationRight:(id)right tintColor:(UIColor *)tintColor clickBlock:(NavButtonClickBlock)block;

@end
