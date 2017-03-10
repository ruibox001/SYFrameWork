//
//  SYTabBarController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYTabBarController.h"
#import "SYTabBarButtonItem.h"
#import "SYTabBarModel.h"

#define TABBAR_ITEM_TAG 10059
#define IPhoneWidth [UIScreen mainScreen].bounds.size.width

@interface SYTabBarController ()

@property (strong, nonatomic) NSMutableArray *tabBarArray;
@property (strong, nonatomic) UIImageView *tabBarView;

@end

@implementation SYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (NSMutableArray *)tabBarArray {
    if (!_tabBarArray) {
        _tabBarArray = [NSMutableArray array];
    }
    return _tabBarArray;
}

#pragma mark - 自定义TabBar
- (void) setCustomTabBarCtrlView
{
    NSArray *normalArray = [[NSArray alloc]initWithObjects:@"icon_screening_unselect.png",@"icon_interview_unselect.png",@"icon_mine_unselect.png", nil];
    NSArray *pressArray = [[NSArray alloc]initWithObjects:@"icon_screening_select.png",@"icon_interview_select.png",@"icon_mine_select.png", nil];
    NSArray *titleArray = @[@"筛选",@"面试",@"我的"];

    _tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.tabBar.frame.size.width,  self.tabBar.frame.size.height)];
    _tabBarView.userInteractionEnabled = YES;
    [_tabBarView setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar addSubview:_tabBarView];
    
    for (int i = 0; i < titleArray.count; i++) {
        SYTabBarModel *info = [[SYTabBarModel alloc]init];
        info.tarBarImageNormal = [normalArray objectAtIndex:i];
        info.tarBarImagePress = [pressArray objectAtIndex:i];
        info.tarBarName = [titleArray objectAtIndex:i];
        info.tarBarUnReadCount = 0;
        [self.tabBarArray addObject:info];
    }

    unsigned long itemCount = self.tabBarArray.count;
    int itemWidth = IPhoneWidth/itemCount;
    for (int index = 0; index < itemCount; index++) {
        SYTabBarButtonItem *button = [[SYTabBarButtonItem alloc]initWithFrame:CGRectMake(index*itemWidth, 0, itemWidth, _tabBarView.frame.size.height) itemInfo:[self.tabBarArray objectAtIndex:index]];
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
