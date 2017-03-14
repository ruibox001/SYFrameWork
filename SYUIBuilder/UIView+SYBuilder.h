//
//  UIView+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"
#import "SYAlphaMaker.h"

#define View   [UIView new]

#define xywh(...) xywhFrame((SYRect){__VA_ARGS__})

@interface UIView (SYBuilder)

/**
 UIView的边框大小颜色圆角
 @return 链试调用返回
 */
SY_UILABEL_PROP(ThreeObject) borderWidthRadius;

/**
 UIView的点击事件
 @return 链试调用返回
 */
SY_UIVIEW_PROP(TargetSel) targetSel;

/**
 UIView的frame
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Rect) xywhFrame;

/**
 UIView把当前界面添加到父控件上
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Object) intoView;

/**
 UIView的origin.x
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) x;

/**
 UIView的origin.y
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) y;

/**
 UIView的size.width
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) w;

/**
 UIView的size.height
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) h;

/**
 UIView的origin
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Point) xy;

/**
 UIView的size
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Size) wh;

/**
 UIView的缩放X轴
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) scaleX;

/**
 UIView的缩放Y轴
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Float) scaleY;

/**
 UIView的背景颜色
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Object) bgColor;

/**
 UIView通过SYAlphaMaker对象填充数据后再设置渐变
 @return 链试调用返回
 */
SY_UIVIEW_PROP(Object) makerAlpha;

/**
 通过界面生成图片
 @return 返回图片
 */
- (UIImage *)snapshot;

/**
 通过界面生成界面
 @return 生成截图的View
 */
- (UIView *)customViewFromSnapshop;

@end
