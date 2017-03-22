//
//  UILabel+SFScroll.m
//  DDG
//
//  Created by 王声远 on 17/3/22.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UILabel+SFScroll.h"
#import <objc/runtime.h>
#import "SFScrollLabelManager.h"

static char scrollLabelKey;

@interface UILabel()

@property (nonatomic,strong) SFScrollLabelManager *manager;

@end

@implementation UILabel (SFScroll)

- (void)setManager:(SFScrollLabelManager *)manager {
    [self willChangeValueForKey:@"scrollLabelKey"];
    objc_setAssociatedObject(self, &scrollLabelKey, manager, OBJC_ASSOCIATION_RETAIN);
    [self didChangeValueForKey:@"scrollLabelKey"];
}

- (SFScrollLabelManager *)manager {
    return objc_getAssociatedObject(self, &scrollLabelKey);
}

- (void)addScrollWithStringArrays:(NSArray *)array animationTime:(CGFloat)aTime mergenTime:(CGFloat)mTime up:(BOOL)up {
    if (!self.manager) {
        self.manager = [[SFScrollLabelManager alloc] initWithLabel:self array:array scollTime:mTime animationTime:aTime up:up];
    }
}

- (UILabel *(^)(NSArray *,CGFloat,CGFloat,BOOL)) addScroll {
    return ^(NSArray *array,CGFloat aTime,CGFloat mTime,BOOL up){
        [self addScrollWithStringArrays:array animationTime:aTime mergenTime:mTime up:up];
        return self;
    };
}

@end
