//
//  UIView+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIView+SYBuilder.h"

@implementation UIView (SYBuilder)

- (SYPropertyUILabelThreeObjectBlock)borderWidthRadius {
    return ^id (id borderColor, id borderWidth, id radius) {
        UIColor *color = nil;
        if ([borderColor isKindOfClass:[UIColor class]]) {
            color = borderColor;
        }
        if (color) {
            [self.layer setMasksToBounds:YES];
            [self.layer setCornerRadius:[radius intValue]];
            [self.layer setBorderWidth:[borderWidth floatValue]];
            [self.layer setBorderColor:color.CGColor];
        }
        return self;
    };
}

- (SYPropertyUIViewTargetSelBlock)targetSel {
    return ^ (id target, SEL sel) {
        if (target && sel) {
            UITapGestureRecognizer *gasture = [[UITapGestureRecognizer alloc] initWithTarget:target action:sel];
            self.userInteractionEnabled =YES;
            [self addGestureRecognizer:gasture];
        }
        return self;
    };
}

- (SYPropertyUIViewRectBlock)xywh {
    return ^ (SYRect rect) {
        [self setFrame:rect.value];
        return self;
    };
}

- (SYPropertyUIViewFloatBlock)x {
    return ^ (CGFloat x) {
        CGRect frame = self.frame;
        frame.origin.x = x;
        [self setFrame:frame];
        return self;
    };
}

- (SYPropertyUIViewFloatBlock)y {
    return ^ (CGFloat y) {
        CGRect frame = self.frame;
        frame.origin.y = y;
        [self setFrame:frame];
        return self;
    };
}

- (SYPropertyUIViewFloatBlock)w {
    return ^ (CGFloat w) {
        CGRect frame = self.frame;
        frame.size.width = w;
        [self setFrame:frame];
        return self;
    };
}

- (SYPropertyUIViewFloatBlock)h {
    return ^ (CGFloat h) {
        CGRect frame = self.frame;
        frame.size.height = h;
        [self setFrame:frame];
        return self;
    };
}

- (SYPropertyUIViewPointBlock)xy {
    return ^ (CGPoint xy) {
        CGRect frame = self.frame;
        frame.origin = xy;
        [self setFrame:frame];
        return self;
    };
}

- (SYPropertyUIViewSizeBlock)wh {
    return ^ (CGSize wh) {
        CGRect frame = self.frame;
        frame.size = wh;
        [self setFrame:frame];
        return self;
    };
}

@end
