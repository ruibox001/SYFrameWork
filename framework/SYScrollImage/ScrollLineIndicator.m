//
//  ScrollLineIndicator.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ScrollLineIndicator.h"

@interface ScrollLineIndicator()

@property (nonatomic,strong) CALayer *myLayer;
@property (nonatomic,weak) UIView *lineView;
@property (nonatomic,weak) UIView *selectView;

@property (nonatomic,assign) NSInteger lineNumber;
@property (nonatomic,assign) CGFloat lineLength;
@property (nonatomic,assign) CGFloat lineSpace;
@property (nonatomic,strong) UIColor *selectColor;

@end

@implementation ScrollLineIndicator

+ (instancetype)shareWithFrame:(CGRect)frame numberOfLine:(NSInteger)numberLines lineColor:(UIColor *)color selectColor:(UIColor *)sColor{
    return [[super alloc] initWithWithFrame:frame numberOfLine:numberLines lineColor:color selectColor:sColor];
}

- (instancetype)initWithWithFrame:(CGRect)frame numberOfLine:(NSInteger)lineNumber lineColor:(UIColor *)color selectColor:(UIColor *)sColor
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor  = [UIColor clearColor];
        self.selectColor = sColor;
        
        CGFloat lineH = 2;
        self.lineLength = 16;
        self.lineSpace = 4;
        CGFloat w = self.lineLength * lineNumber + self.lineSpace * (lineNumber - 1);
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - w)*0.5, frame.size.height-lineH*6, w, lineH)];
        [self addSubview:lineView];
        lineView.backgroundColor = [UIColor clearColor];
        self.lineView = lineView;
        
        [self drawLineOfDashByCAShapeLayer:lineView lineColor:color];
    
    }
    return self;
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 **/
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineColor:(UIColor *)lineColor {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:self.lineLength], [NSNumber numberWithInt:self.lineSpace], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    if (self.myLayer) {
        [lineView.layer replaceSublayer:self.myLayer with:shapeLayer];
    }
    else {
        [lineView.layer addSublayer:shapeLayer];
    }
    self.myLayer = shapeLayer;
    [self drawSelectLineOfNumber:0];
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 **/
- (void)drawSelectLineOfNumber:(NSInteger)lineNumber {
    
    if (lineNumber < 0) {
        return;
    }
    
    if (self.selectView) {
        [self.selectView removeFromSuperview];
    }
    
    CGFloat x = self.lineLength * lineNumber + self.lineSpace * lineNumber;
    
    UIView *sView = [[UIView alloc] initWithFrame:CGRectMake(x, 0, self.lineLength, self.lineView.frame.size.height)];
    [self.lineView addSubview:sView];
    self.selectView = sView;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:sView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(sView.frame) / 2, CGRectGetHeight(sView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:self.selectColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(sView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:self.lineLength], [NSNumber numberWithInt:self.lineSpace], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(sView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [sView.layer addSublayer:shapeLayer];
}

- (UIColor *)selectColor {
    if (!_selectColor) {
        _selectColor = [UIColor whiteColor];
    }
    return _selectColor;
}

@end
