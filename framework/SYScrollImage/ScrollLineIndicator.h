//
//  ScrollLineIndicator.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollLineIndicator : UIView

+ (instancetype)shareWithFrame:(CGRect)frame numberOfLine:(NSInteger)numberLines lineColor:(UIColor *)color selectColor:(UIColor *)sColor;

- (void)drawSelectLineOfNumber:(NSInteger)lineNumber;

@end
