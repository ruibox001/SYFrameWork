//
//  ScrollDotIndicator.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollDotIndicator : UIView

+ (instancetype) shareWithDotIndicatorWithFrame:(CGRect)frame numberOfPages:(NSInteger)page normalColor:(UIColor *)nColor cColor:(UIColor *)cColor;

- (void)setPageIndex:(NSInteger)page;

@end
