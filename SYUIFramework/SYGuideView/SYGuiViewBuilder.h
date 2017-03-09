//
//  SYGuiViewBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define GuiViewBuilder SYGuiViewBuilder

@interface SYGuiViewBuilder : NSObject

GuiViewBuilder *guiViewBuilder();

/**
 构建显示引导页
 @return 构建器
 */
- (GuiViewBuilder *(^)())show ;

/**
 构建体验按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(UIButton *,void (^)()))button ;

/**
 体验按钮距离底部位置
 @return 构建器
 */
- (GuiViewBuilder *(^)(CGFloat))btnBottonOffset ;

/**
 引导页图片数据
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSArray *))images ;
- (GuiViewBuilder *(^)(NSString *))addImageName;

/**
 自定义构建体验图片按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSString *,void (^)()))createImageBtn ;

/**
 自定义构建体验按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSString *,UIColor *,UIColor *,CGFloat,CGSize,CGFloat,void (^)()))createBtn;

@end
