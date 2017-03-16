//
//  UIButton+Builder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIButton+SYBuilder.h"


@implementation UIButton (SYBuilder)


- (SYPropertyUIButtonObjectBlock)nTitle {
    return ^id (id title){
        if ([title isKindOfClass:[NSString class]]) {
            [self setTitle:title forState:UIControlStateNormal];
        }
        return self;
    };
}

- (SYPropertyUIButtonObjectBlock)sTitle {
    return ^id (id sTitle){
        if ([sTitle isKindOfClass:[NSString class]]) {
            [self setTitle:sTitle forState:UIControlStateSelected];
        }
        return self;
    };
}

- (SYPropertyUIButtonObjectBlock)nTitleColor {
    return ^id (id nColor){
        if ([nColor isKindOfClass:[UIColor class]]) {
            [self setTitleColor:nColor forState:UIControlStateNormal];
        }
        return self;
    };
}

- (SYPropertyUIButtonObjectBlock)sTitleColor {
    return ^id (id sColor){
        if ([sColor isKindOfClass:[UIColor class]]) {
            [self setTitleColor:sColor forState:UIControlStateSelected];
        }
        return self;
    };
}

- (SYPropertyUIButtonObjectBlock)btnFont {
    return ^id (id btnFont){
        if ([btnFont isKindOfClass:[UIFont class]]) {
            self.titleLabel.font = btnFont;
        }
        return self;
    };
}

- (SYPropertyUIButtonTargetSelBlock)targetAction{
    return ^id (id target, SEL sel){
        [self addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (SYPropertyUIButtonBoolBlock)selet {
    return ^id (BOOL selet){
        [self setSelected:selet];
        return self;
    };
}

@end
