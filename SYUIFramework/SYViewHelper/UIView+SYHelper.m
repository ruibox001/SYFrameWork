//
//  UIView+STKHelper.m
//  Tronker
//
//  Created by 王声远 on 17/2/25.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "UIView+SYHelper.h"

@implementation UIView (SYHelper)

/**
 通过界面生成图片
 @param UIImage 返回生成的图片
 @return 返回图片
 */
- (UIImage *)snapshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 通过界面生成界面
 @return 生成截图的View
 */
- (UIView *)customViewFromSnapshop {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.backgroundColor = [UIColor whiteColor];
    return snapshot;
}

/**
 给View添加圆角效果
 @param radius 圆角radius
 @param width 圆角外边框的大小
 @param color 圆角外边框颜色
 */
-(void)layerForViewWithRadius:(CGFloat)radius lineWidth:(CGFloat)width color:(UIColor *)color
{
    //画边框
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color.CGColor];
}

/**
 *  缩放视图
 *  @param scaleX x的缩放比
 *  @param scaleY y的缩放比
 */
- (void)scaleViewWithScaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY
{
    [self.layer setValue:@(scaleX) forKeyPath:@"transform.scale.x"];
    [self.layer setValue:@(scaleY) forKeyPath:@"transform.scale.y"];
}

/**
 *  添加点击事件
 */
- (void)viewAddClickWithTarget:(id)target sel:(SEL)sec {
    UITapGestureRecognizer *gasture = [[UITapGestureRecognizer alloc] initWithTarget:target action:sec];
    self.userInteractionEnabled =YES;
    [self addGestureRecognizer:gasture];
}

/**
 给界面添加渐变颜色
 @param alphaColors 渐变颜色数组
 @param startPoint 开始点0-1
 @param endPoint 结束点0-1
 */
- (void)viewAddAlphaColors:(NSArray *)alphaColors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in alphaColors) {
        NSAssert([color isKindOfClass:[UIColor class]],@"alphaColors必须为颜色数据");
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    if (cgColors.count == 0) {
        return;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = cgColors;
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.frame;
    [self.layer addSublayer:gradientLayer];
}

@end
