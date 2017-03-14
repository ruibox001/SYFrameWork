//
//  UIViewController+TabBar.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/11.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIViewController+TabBarHidden.h"
#import "SYTabBarMaker.h"

@implementation UIViewController (TabBarHidden)

- (void)hidenTabBar:(BOOL)hidden {
    
    NSInteger index = currentSelectIndex();
    NSInteger temp = index;
    if (index > 1) {
        index -= 1;
    }
    else {
        index += 1;
    }
    self.hidesBottomBarWhenPushed = hidden;
    [self.navigationController.tabBarController setSelectedIndex:index];
    [self.navigationController.tabBarController setSelectedIndex:temp];
}

@end
