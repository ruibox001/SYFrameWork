//
//  SYTabBarController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYTabBarController.h"
#import "SYTabBarButtonItem.h"


#define TABBAR_ITEM_TAG 10059
#define IPhoneWidth [UIScreen mainScreen].bounds.size.width

@interface SYTabBarController ()

@property (strong, nonatomic) UIImageView *tabBarView;

@end

@implementation SYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *)itemModels {
    if (!_itemModels) {
        _itemModels = [NSMutableArray array];
    }
    return _itemModels;
}

#pragma mark - 自定义TabBar
- (void) customTabBarItemView
{
    _tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.tabBar.frame.size.width,  self.tabBar.frame.size.height)];
    _tabBarView.userInteractionEnabled = YES;
    [_tabBarView setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar addSubview:_tabBarView];


    int itemWidth = IPhoneWidth/self.itemModels.count;
    for (int index = 0; index < self.itemModels.count; index++) {
        SYTabBarButtonItem *button = [[SYTabBarButtonItem alloc]initWithFrame:CGRectMake(index*itemWidth, 0, itemWidth, _tabBarView.frame.size.height) itemInfo:[self.itemModels objectAtIndex:index]];
        button.tag = TABBAR_ITEM_TAG + index;
        [button addTarget:self action:@selector(tabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
        if (index == self.selectedIndex) {
            [button setSelected:YES];
        }
        [_tabBarView addSubview:button];
        [button reloadData];
    }
    [self.tabBar bringSubviewToFront:_tabBarView];
}

- (void) tabBarItemClick:(SYTabBarButtonItem *)button
{
    self.selectedIndex = button.tag - TABBAR_ITEM_TAG;
    
    UIView *superView = button.superview;
    for (id view in superView.subviews) {
        if ([view isKindOfClass:[SYTabBarButtonItem class]]) {
            SYTabBarButtonItem *buttonView = (SYTabBarButtonItem *)view;
            [buttonView setSelected:NO];
        }
    }
    [button setSelected:YES];
    [button reloadData];
    if(self.selectTabBarItemBlock){
        self.selectTabBarItemBlock(self.selectedIndex);
    }
}

/**
 设置未读数
 @param count 未读数
 @param selectedIndex 第几个tarBar
 */
- (void) setTabBarItemUnReadCount:(int)count selectedIndex:(NSInteger)selectedIndex
{
    if (selectedIndex >= self.itemModels.count) {
        return;
    }
    SYTabBarButtonItem *buttonItem = (SYTabBarButtonItem *)[_tabBarView viewWithTag:TABBAR_ITEM_TAG+selectedIndex];
    if (buttonItem) {
        buttonItem.model.tarBarUnReadCount = count;
        [buttonItem reloadData];
    }
}

/**
 选中当前tarBar
 @param selectIndex tarBar位置
 */
- (void) changeSelectTabBarItem:(NSInteger)selectIndex
{
    if (selectIndex >= self.itemModels.count) {
        return;
    }
    self.selectedIndex = selectIndex;
    for (id view in _tabBarView.subviews) {
        if ([view isKindOfClass:[SYTabBarButtonItem class]]) {
            SYTabBarButtonItem *buttonView = (SYTabBarButtonItem *)view;
            [buttonView setSelected:NO];
            if (buttonView.tag - TABBAR_ITEM_TAG == selectIndex) {
                [buttonView setSelected:YES];
            }
        }
    }
}

@end
