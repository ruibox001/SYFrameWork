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

/**
 UIImageView的图片
 @return 链试调用返回
 */
SY_UIIMAGEVIEW_PROP(Object) img;

/**
 UIImageView的图片模式
 @return 链试调用返回
 */
SY_UIIMAGEVIEW_PROP(Int) mode;

@end
