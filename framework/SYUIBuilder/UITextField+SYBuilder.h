//
//  UITextField+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define TextField   [UITextField new]

@interface UITextField (SYBuilder)

SY_UITEXTFIELD_PROP(Object) strColor;

SY_UITEXTFIELD_PROP(Object) delegat;

SY_UITEXTFIELD_PROP(Object) placeHoder;

SY_UITEXTFIELD_PROP(Object) leftV;

SY_UITEXTFIELD_PROP(Object) rightV;

@end
