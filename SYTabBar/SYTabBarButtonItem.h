//
//  SYTabBarController.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYTabBarModel;
@class SYUnReadView;

@interface SYTabBarButtonItem : UIButton

@property (strong, nonatomic) UIImageView *titleImageView;  //图片控件
@property (strong, nonatomic) UILabel *titleTextLabel;      //标题控件
@property (strong, nonatomic) SYUnReadView *msgCountLabel;  //未读数控件
@property (strong, nonatomic) SYTabBarModel *model;         //模型


/**
 初始化

 @param frame frame
 @param model 模型
 @return self
 */
- (id)initWithFrame:(CGRect)frame itemInfo:(SYTabBarModel *)model;

/**
 刷新数据
 */
- (void) reloadData;

@end
