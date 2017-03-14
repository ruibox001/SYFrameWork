//
//  UILabel+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UILabel+SYBuilder.h"

@implementation UILabel (SYBuilder)

- (SYPropertyUILabelObjectBlock)labelText {
    return ^id (id text) {
        if ([text isKindOfClass:[NSString class]]) {
            self.text = text;
        }
        return self;
    };
}

- (SYPropertyUILabelObjectBlock)labelFont {
    return ^id (id labelFont) {
        if ([labelFont isKindOfClass:[UIFont class]]) {
            self.font = labelFont;
        }
        return self;
    };
}

- (SYPropertyUILabelObjectBlock)labelTextColor {
    return ^id (id labelTextColor) {
        if ([labelTextColor isKindOfClass:[UIColor class]]) {
            self.textColor = labelTextColor;
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
