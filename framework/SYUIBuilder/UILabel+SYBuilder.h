//
//  UILabel+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define Label   [UILabel new]

@interface UILabel (SYBuilder)

/**
 UILabel的文本设置
 @return 链试调用返回
 */
SY_UILABEL_PROP(Object) labelText;

/**
 UILabel的文本字体
 @return 链试调用返回
 */
SY_UILABEL_PROP(Object) labelFont;

/**
 UILabel的文本颜色
 @return 链试调用返回
 */
SY_UILABEL_PROP(Object) labelTextColor;

/**
 UILabel的文本对齐方式
 @return 链试调用返回
 */
SY_UILABEL_PROP(Int) alignment;

/**
 UILabel添加富文本字符串
 @return 链试调用返回
 */
SY_UILABEL_PROP(Object) mutableAttibuteString;

@end
