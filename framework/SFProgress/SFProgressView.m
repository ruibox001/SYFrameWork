//
//  SFProgressView.m
//  DDG
//
//  Created by 王声远 on 17/3/24.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SFProgressView.h"

@interface SFProgressView()

@property (strong, nonatomic) CAGradientLayer *changeColorLayer;
@property (strong, nonatomic) NSArray *colors;

@end

@implementation SFProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.layer addSublayer:self.changeColorLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.changeColorLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = self.bgColor;
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:self.cornerRadius];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.changeColorLayer.frame = CGRectMake(0, 0, self.frame.size.width * progress,  self.frame.size.height);
    _changeColorLayer.colors     = self.colors;
}

- (CAGradientLayer *)changeColorLayer{
    if (!_changeColorLayer) {
        _changeColorLayer = [CAGradientLayer layer];
        _changeColorLayer.frame = CGRectMake(0, 0, 0, 0);
        _changeColorLayer.startPoint = CGPointMake(0, 1);
        _changeColorLayer.endPoint   = CGPointMake(1, 1);
    }
    return _changeColorLayer;
}

- (CGFloat)cornerRadius {
    if (_cornerRadius == 0) {
        _cornerRadius = self.frame.size.height*0.5;
    }
    return _cornerRadius;
}

- (UIColor *)bgColor {
    if (!_bgColor) {
        _bgColor = [UIColor grayColor];
    }
    return _bgColor;
}

- (NSArray *)colors {
    if (!_colors) {
        _colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor];
    }
    return _colors;
}

- (void)setProgressColors:(id)progressColors {
    NSMutableArray *array = [NSMutableArray array];
    if ([progressColors isKindOfClass:[NSArray class]]) {
        for (UIColor *c in progressColors) {
            [array addObject:(__bridge id)c.CGColor];
        }
    }
    else if ([progressColors isKindOfClass:[UIColor class]]) {
        UIColor *c = progressColors;
        [array addObject:(__bridge id)c.CGColor];
        [array addObject:(__bridge id)c.CGColor];
    }
    self.colors = array;
}

@end
