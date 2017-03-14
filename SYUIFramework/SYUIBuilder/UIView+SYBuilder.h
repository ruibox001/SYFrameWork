//
//  UIView+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define View   [UIView new]

@interface UIView (SYBuilder)

SY_UILABEL_PROP(ThreeObject) borderWidthRadius;

SY_UIVIEW_PROP(TargetSel) targetSel;

SY_UIVIEW_PROP(Rect) xywh;

SY_UIVIEW_PROP(Float) x;

SY_UIVIEW_PROP(Float) y;

SY_UIVIEW_PROP(Float) w;

SY_UIVIEW_PROP(Float) h;

SY_UIVIEW_PROP(Point) xy;

SY_UIVIEW_PROP(Size) wh;

@end
