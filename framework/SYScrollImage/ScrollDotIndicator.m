//
//  ScrollDotIndicator.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ScrollDotIndicator.h"

@interface ScrollDotIndicator()

@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation ScrollDotIndicator

+ (instancetype) shareWithDotIndicatorWithFrame:(CGRect)frame numberOfPages:(NSInteger)page normalColor:(UIColor *)nColor cColor:(UIColor *)cColor {
    return [[super alloc] initWithFrame:frame numberOfPages:page normalColor:nColor cColor:cColor];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfPages:(NSInteger)page normalColor:(UIColor *)nColor cColor:(UIColor *)cColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.pageControl.numberOfPages = page;
        self.pageControl.currentPageIndicatorTintColor = cColor;
        self.pageControl.pageIndicatorTintColor = nColor;
    }
    return self;
}

- (void)setPageIndex:(NSInteger)page {
    self.pageControl.currentPage = page;
}


- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:self.bounds];
        [self addSubview:_pageControl];
        [self bringSubviewToFront:self.pageControl];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.hidesForSinglePage=YES;
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

@end
