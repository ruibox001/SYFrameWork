//
//  SYGuideView.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYGuideView : NSObject

/**
 体验按钮/点击回调
 */
@property (nonatomic,strong) UIButton *guideBtn;


/**
 引导页图片数据
 */
@property (nonatomic,strong) NSMutableArray *guideImages;

/**
 体验按钮距离底部位置
 */
@property (nonatomic,assign) CGFloat guideBtnBottonOffset;

/**
 *  引导页显示
 */
- (void)show;
- (void)removeAllViews;

@end
