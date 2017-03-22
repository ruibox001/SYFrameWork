//
//  UILabel+SFScroll.h
//  DDG
//
//  Created by 王声远 on 17/3/22.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SFScroll)

- (void)addScrollWithStringArrays:(NSArray *)array animationTime:(CGFloat)aTime mergenTime:(CGFloat)mTime up:(BOOL)up;

- (UILabel *(^)(NSArray *,CGFloat,CGFloat,BOOL)) addScroll;

@end
