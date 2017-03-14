//
//  UIButton+Builder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define Button   [UIButton buttonWithType:UIButtonTypeCustom]

@interface UIButton (SYBuilder)

/**
 UIButton的普通状态文本
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Object) nTitle;

/**
 UIButton的选中状态文本
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Object) sTitle;

/**
 UIButton的普通状态文本颜色
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Object) nTitleColor;

/**
 UIButton的选中状态文本颜色
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Object) sTitleColor;

/**
 UIButton的文本大小
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Object) btnFont;

/**
 UIButton的点击事件
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(TargetSel) targetAction;

/**
 UIButton的设置是否select
 @return 链试调用返回
 */
SY_UIBUTTON_PROP(Bool) selet;

@end
