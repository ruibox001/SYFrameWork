//
//  HSYScrollImageView.h
//
//  Created by 王声远 on 15/5/8.
//  Copyright (c) 2015年 王声远. All rights reserved.
// 

#import <UIKit/UIKit.h>
#import "UIView+SYBuilder.h"

typedef NS_ENUM(NSInteger, ScrollImageIndicatorStyle) {
    ScrollImageIndicatorStyleDot     = 0,
    ScrollImageIndicatorStyleLine = 1,
};

typedef void (^scrollImageClick)(NSInteger index);

#define scrollImageLimit scrollImage(YES)
#define scrollImageUnLimit scrollImage(NO)

@interface SYScrollImageView : UIView

//增加方法
SYScrollImageView *scrollImage(BOOL limit);

- (SYScrollImageView *(^)(CGFloat))seconds;

- (SYScrollImageView *(^)(ScrollImageIndicatorStyle))indicatorStyle ;

- (SYScrollImageView *(^)(UIColor *))indicatorNormalColor ;

- (SYScrollImageView *(^)(UIColor *))indicatorCurrentColor ;

- (SYScrollImageView *(^)(NSArray *))addUrls ;

- (SYScrollImageView *(^)(NSString *))addUrl ;

- (SYScrollImageView *(^)(void (^)(NSInteger index)))click ;

- (SYScrollImageView *(^)(void (^)(NSInteger index)))scrollBlock ;

@end
