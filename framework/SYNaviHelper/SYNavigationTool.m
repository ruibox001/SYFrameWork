//
//  SYNavigationTool.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYNavigationTool.h"

#define IPhoneWidth   ([[UIScreen mainScreen] bounds].size.width)    //手机屏幕宽
#define IPhoneHeight ([[UIScreen mainScreen] bounds].size.height)    //手机屏幕高

#define kNavigationTitleViewWidth (IPhoneWidth * 0.5)

#define SFSIZE_NavButtonHeight_Normal 44              // 导航栏按钮大小
#define SFSIZE_NavButtonWidth_Normal 124*0.5

#define SFCOLOR_BLACK_COLOR [UIColor whiteColor]
#define SFFONT_NAV_TITLE_SIZE 18.0                      // 默认导航字体大小

#define kNavigationLeftRightFont 16

#define kDefaultColor [UIColor blackColor]

@interface SYNavigationTool()

@property (copy, nonatomic) NavButtonClickBlock leftBlock; //点击导航栏左按钮
@property (copy, nonatomic) NavButtonClickBlock rightBlock; //点击导航栏左按钮

@property (strong, nonatomic)  UIBarButtonItem *leftItem;
@property (strong, nonatomic)  UIBarButtonItem *rightItem;

@property (strong, nonatomic) UILabel *titleLabel;         //标题

@property (strong, nonatomic) UIButton *leftButton;        //左按钮
@property (strong, nonatomic) UIButton *rightButton;       //右按钮

@end

@implementation SYNavigationTool

- (void)addTitle:(NSString *)title ctl:(UIViewController *)ctl titleColor:(UIColor *)titleColor{
    if (![ctl.navigationItem.titleView isEqual:self.titleLabel]) {
        ctl.navigationItem.titleView = self.titleLabel;
    }
    if (titleColor) {
        self.titleLabel.textColor = titleColor;
    }
    self.titleLabel.text = title;
}

- (void)addLeft:(id)left ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block{
    
    self.leftBlock = block;
    
    if (!left) {
        UIImage *image = [[UIImage imageNamed:@"back_2@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.leftItem.image = image;
        ctl.navigationItem.leftBarButtonItem = self.leftItem;
        return;
    }
    
    color = color ?: kDefaultColor;
    if ([left isKindOfClass:[UIImage class]]) {
        [self.leftItem setImage:left];
        [self.leftItem setTintColor:color];
    }
    else if ([left isKindOfClass:[NSString class]]) {
        [self.leftItem setTintColor:color];
        [self.leftItem setCustomView:self.leftButton];
        [self.leftButton setTitle:left forState:UIControlStateNormal];
        [self.leftButton setTitleColor:color forState:UIControlStateNormal];
    }
    ctl.navigationItem.leftBarButtonItem = self.leftItem;
}

- (void)addRight:(id)right ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block {
    
    self.rightBlock = block;
    color = color ?: kDefaultColor;
    
    if ([right isKindOfClass:[UIImage class]]) {
        [self.rightItem setImage:right];
        [self.rightItem setTintColor:color];
    }
    else if ([right isKindOfClass:[NSString class]]) {
        [self.rightItem setTintColor:color];
        [self.rightItem setCustomView:self.rightButton];
        [self.rightButton setTitle:right forState:UIControlStateNormal];
        [self.rightButton setTitleColor:color forState:UIControlStateNormal];
    }
    ctl.navigationItem.rightBarButtonItem = self.rightItem;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, kNavigationTitleViewWidth,SFSIZE_NavButtonHeight_Normal)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
    }
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 0, SFSIZE_NavButtonWidth_Normal, SFSIZE_NavButtonHeight_Normal);
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _leftButton.backgroundColor = [UIColor clearColor];
        _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:kNavigationLeftRightFont];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, SFSIZE_NavButtonWidth_Normal, SFSIZE_NavButtonHeight_Normal);
        [_rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _rightButton.backgroundColor = [UIColor clearColor];
        _rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -25);
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:kNavigationLeftRightFont];
    }
    return _rightButton;
}

- (UIBarButtonItem *)leftItem {
    if (!_leftItem) {
        _leftItem = [[UIBarButtonItem alloc] init];
        _leftItem.target = self;
        _leftItem.action = @selector(leftClick);
    }
    return _leftItem;
}

- (UIBarButtonItem *)rightItem {
    if (!_rightItem) {
        _rightItem = [[UIBarButtonItem alloc] init];
        _rightItem.target = self;
        _rightItem.action = @selector(rightClick);
    }
    return _rightItem;
}

#pragma mark - 点击事件
- (void)leftClick {
    if (self.leftBlock) {
        self.leftBlock();
    }
}

- (void)rightClick {
    if (self.rightBlock) {
        self.rightBlock();
    }
}

@end
