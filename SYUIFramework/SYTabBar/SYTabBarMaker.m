//
//  SYTabBarMaker.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/11.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYTabBarMaker.h"
#import "SYTabBarController.h"

@interface SYTabBarMaker()

@property (nonatomic,strong) SYTabBarController *tabBarController;
@property (nonatomic,strong) NSMutableArray *navigations;

@end

@implementation SYTabBarMaker


/**
 初始化构建器
 @return 构建器
 */
TabBarMaker *tabBarBuilder(){
    static  TabBarMaker *m = nil;
    if (!m) {
        m = TabBarMaker.new;
        m.tabBarController = [[SYTabBarController alloc]init];
    }
    return m;
}

/**
 设置tabBar构建显示
 @return 构建器
 */
- (TabBarMaker *(^)())show {
    return ^id(){
        
        self.tabBarController.viewControllers = self.navigations;
        [self.tabBarController customTabBarItemView];
        [[[UIApplication sharedApplication].delegate window] setRootViewController:self.tabBarController];
        
        return self;
    };
}

/**
 设置tabBar未读数《index第几个tabBar,unReadCount未读数》
 @return 构建器
 */
- (TabBarMaker *(^)(int,int))changeRedPointWithIndexAndCount {
    return ^id(int index,int unReadCount){
        [self.tabBarController setTabBarItemUnReadCount:unReadCount selectedIndex:index];
        return self;
    };
}


/**
 选中第几个tabBar
 @return 构建器
 */
- (TabBarMaker *(^)(int))select {
    return ^id(int tabBarSelect){
        [self.tabBarController changeSelectTabBarItem:tabBarSelect];
        return self;
    };
}

/**
 获取当前选中的Index
 */
int currentSelectIndex() {
    return (int)tabBarBuilder().tabBarController.selectedIndex;
}

/**
 构建tabBar元素(UIViewControler,UINavigationController,normalImage,selectImage,itemName,itemNameNormalColor,itemNameSelectColor)
 @return 构建器
 */
- (TabBarMaker *(^)(NSString *,NSString *,NSString *,NSString *,NSString *,UIColor *,UIColor *))controllerAndNavigationControllerWithInfo {
    return ^id(NSString *controller,NSString *navigationController,NSString *normalImage,NSString *selectImage,NSString *itemName,UIColor *itemNameNormalColor,UIColor *itemNameSelectColor){
        
        NSAssert(controller,@"controller不能为空");
        
        Class ctrClass = NSClassFromString(controller);
        if (!navigationController) {
            navigationController = @"UINavigationController";
        }
        Class naviClass = NSClassFromString(navigationController);
        
        NSAssert([ctrClass isSubclassOfClass:[UIViewController class]],@"controller必须为UIController的class");
        NSAssert([naviClass isSubclassOfClass:[UINavigationController class]],@"navigationController必须为UINavigationController的class");

        UIViewController *ctr = [[ctrClass alloc] init];
        UINavigationController *navi = [[naviClass alloc] initWithRootViewController:ctr];
        [self.navigations addObject:navi];
        
        SYTabBarModel *m = [[SYTabBarModel alloc] init];
        m.tarBarName = itemName;
        m.tarBarImageNormal = normalImage;
        m.tarBarImagePress = selectImage;
        m.tarBarSelectColor = itemNameSelectColor;
        m.tarBarUnSelectColor = itemNameNormalColor;
        [self.tabBarController.itemModels addObject:m];
        
        return self;
    };
}

- (NSMutableArray *)navigations {
    if (!_navigations) {
        _navigations = [NSMutableArray array];
    }
    return _navigations;
}

@end
