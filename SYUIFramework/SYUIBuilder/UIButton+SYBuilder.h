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

SY_UIBUTTON_PROP(Object) nTitle;

SY_UIBUTTON_PROP(Object) sTitle;

SY_UIBUTTON_PROP(Object) nTitleColor;

SY_UIBUTTON_PROP(Object) sTitleColor;

SY_UIBUTTON_PROP(Object) bgColor;

SY_UIBUTTON_PROP(Object) font;

SY_UIBUTTON_PROP(TargetSel) targetAction;

@end
