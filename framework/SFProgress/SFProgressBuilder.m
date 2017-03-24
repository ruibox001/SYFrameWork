//
//  SFProgressBuilder.m
//  DDG
//
//  Created by 王声远 on 17/3/24.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SFProgressBuilder.h"

@implementation SFProgressBuilder

SFProgressBuilder *progressMaker() {
    SFProgressBuilder *builder = SFProgressBuilder.new;
    return builder;
}

- (SFProgressBuilder *(^)(UIColor *))progressBgColor {
    return ^(UIColor *color){
        self.bgColor = color;
        return self;
    };
}

- (SFProgressBuilder *(^)(CGFloat))progressRadius {
    return ^(CGFloat radius){
        self.cornerRadius = radius;
        return self;
    };
}

- (SFProgressBuilder *(^)(id))progressyColor {
    return ^(id colors){
        self.progressColors = colors;
        return self;
    };
}

- (SFProgressBuilder *(^)(CGFloat))setProgress {
    return ^(CGFloat p){
        self.progress = p;
        return self;
    };
}

- (SFProgressBuilder *(^)(UIView *))showInVIew {
    return ^(UIView *pv){
        [pv addSubview:self];
        return self;
    };
}

- (SFProgressBuilder *(^)(CGRect))withFrame {
    return ^(CGRect f){
        [self setFrame:f];
        return self;
    };
}

@end
