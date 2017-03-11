//
//  SYTabBarMaker.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/11.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewController+TabBarHidden.h"

#define TabBarMaker SYTabBarMaker
#define TabBar tabBarBuilder()

@interface SYTabBarMaker : NSObject

/**
 初始化构建器
 @return 构建器
 */
TabBarMaker *tabBarBuilder();

/**
 设置tabBar构建显示
 @return 构建器
 */
- (TabBarMaker *(^)())show;

/**
 设置tabBar未读数《index第几个tabBar,unReadCount未读数》
 @return 构建器
 */
- (TabBarMaker *(^)(int,int))changeRedPointWithIndexAndCount;

/**
 选中第几个tabBar
 @return 构建器
 */
- (TabBarMaker *(^)(int))select ;

/**
 获取当前选中的Index
 */
int currentSelectIndex();

/**
 构建tabBar元素(UIViewControler,UINavigationController,normalImage,selectImage,itemName,itemNameNormalColor,itemNameSelectColor)
 @return 构建器
 */
- (TabBarMaker *(^)(NSString *,NSString *,NSString *,NSString *,NSString *,UIColor *,UIColor *))controllerAndNavigationControllerWithInfo;


//tarBar构建例子
/*
- (void)buildTabBar
{
    NSArray *normalArray = [[NSArray alloc]initWithObjects:@"icon_screening_unselect.png",@"icon_interview_unselect.png",@"icon_mine_unselect.png", nil];
    NSArray *pressArray = [[NSArray alloc]initWithObjects:@"icon_screening_select.png",@"icon_interview_select.png",@"icon_mine_select.png", nil];
    NSArray *titleArray = @[@"筛选",@"面试",@"我的"];
    NSArray *ctrsArray = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController"];
    for(int i = 0; i < titleArray.count; i ++){
        TabBar.controllerAndNavigationControllerWithInfo(ctrsArray[i],@"UINavigationController",normalArray[i],pressArray[i],titleArray[i],nil,nil);
    }
    TabBar.show();
}
*/

@end
