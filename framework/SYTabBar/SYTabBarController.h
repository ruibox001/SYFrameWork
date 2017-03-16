//
//  SYTabBarController.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTabBarModel.h"

@interface SYTabBarController : UITabBarController

@property (copy, nonatomic) void (^selectTabBarItemBlock)(NSInteger selectIndex);

@property (strong, nonatomic) NSMutableArray *itemModels;

/** 添加自定义Tabbar */
- (void) customTabBarItemView;

/**
 选中当前tarBar
 @param selectIndex tarBar位置
 */
- (void) changeSelectTabBarItem:(NSInteger)selectIndex;

/**
 设置未读数
 @param count 未读数
 @param selectedIndex 第几个tarBar
 */
- (void) setTabBarItemUnReadCount:(int)count selectedIndex:(NSInteger)selectedIndex;

@end
