//
//  SYTabBarModel.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYTabBarModel.h"

@implementation SYTabBarModel

/**
 getter方法判断默认颜色
 @return 默认颜色
 */
- (UIColor *)tarBarUnSelectColor {
    if (!_tarBarUnSelectColor) {
        _tarBarUnSelectColor = [UIColor grayColor];
    }
    return _tarBarUnSelectColor;
}

/**
 getter方法判断默认颜色
 @return 默认颜色
 */
- (UIColor *)tarBarSelectColor {
    if (!_tarBarSelectColor) {
        _tarBarSelectColor = [UIColor blueColor];
    }
    return _tarBarSelectColor;
}

@end
