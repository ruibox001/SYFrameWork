//
//  SYNavigationTool.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^NavButtonClickBlock)();

@interface SYNavigationTool : NSObject

- (void)addTitle:(NSString *)title ctl:(UIViewController *)ctl titleColor:(UIColor *)titleColor;

- (void)addLeft:(id)left ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block;

- (void)addRight:(id)right ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block;

@end
