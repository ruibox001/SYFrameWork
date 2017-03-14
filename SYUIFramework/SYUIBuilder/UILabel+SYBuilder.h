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

SY_UILABEL_PROP(Object) text;

SY_UILABEL_PROP(Object) font;

SY_UILABEL_PROP(Object) textColor;

SY_UILABEL_PROP(Object) bgColor;

SY_UILABEL_PROP(Int) alignment;

@end
