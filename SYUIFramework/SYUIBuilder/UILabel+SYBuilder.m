//
//  UILabel+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UILabel+SYBuilder.h"

@implementation UILabel (SYBuilder)

- (SYPropertyUILabelObjectBlock)text {
    return ^id (id text) {
        if ([text isKindOfClass:[NSString class]]) {
            self.text = text;
        }
        return self;
    };
}

- (SYPropertyUILabelObjectBlock)font {
    return ^id (id font) {
        if ([font isKindOfClass:[UIFont class]]) {
            self.font = font;
        }
        return self;
    };
}

- (SYPropertyUILabelObjectBlock)textColor {
    return ^id (id textColor) {
        if ([textColor isKindOfClass:[UIColor class]]) {
            self.textColor = textColor;
        }
        return self;
    };
}

- (SYPropertyUILabelObjectBlock)bgColor {
    return ^id (id bgColor) {
        if ([bgColor isKindOfClass:[UIColor class]]) {
            self.backgroundColor = bgColor;
        }
        return self;
    };
}

- (SYPropertyUILabelIntBlock)alignment {
    return ^id (NSInteger alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

@end
