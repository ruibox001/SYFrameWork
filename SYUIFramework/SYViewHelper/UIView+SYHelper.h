//
//  UIView+STKHelper.h
//  Tronker
//
//  Created by 王声远 on 17/2/25.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYHelper)

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

/**
 给View添加圆角效果
 @param radius 圆角radius
 @param width 圆角外边框的大小
 @param color 圆角外边框颜色
 */
-(void)layerForViewWithRadius:(CGFloat)radius lineWidth:(CGFloat)width color:(UIColor *)color;

/**
 *  缩放视图
 *  @param scaleX x的缩放比
 *  @param scaleY y的缩放比
 */
- (void)scaleViewWithScaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY;

/**
 *  给View添加点击事件
 */
- (void)viewAddClickWithTarget:(id)target sel:(SEL)sec;

/**
 给界面添加渐变颜色
 @param alphaColors 渐变颜色数组
 @param startPoint 开始点0-1
 @param endPoint 结束点0-1
 */
- (void)viewAddAlphaColors:(NSArray *)alphaColors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
