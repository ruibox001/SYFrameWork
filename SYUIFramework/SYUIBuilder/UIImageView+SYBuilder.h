//
//  UIImageView+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define ImageView   [UIImageView new]

@interface UIImageView (SYBuilder)

SY_UIIMAGEVIEW_PROP(Object) img;

SY_UIIMAGEVIEW_PROP(Int) mode;

@end
