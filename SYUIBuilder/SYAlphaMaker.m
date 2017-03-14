//
//  SYAlphaMaker.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYAlphaMaker.h"

@implementation SYAlphaMaker

AlphaKer *alphaBuilder(){
    AlphaKer *a = AlphaKer.new;
    a.alphaColors = NSMutableArray.array;
    return a;
}

- (AlphaKer *(^)(UIColor *))addColor {
    return ^ (UIColor *color) {
        if (self.alphaColors) {
            [self.alphaColors addObject:color];
        }
        return self;
    };
}

- (AlphaKer *(^)(NSArray *))arrayColors {
    return ^ (NSArray *colors) {
        if (self.alphaColors) {
            [self.alphaColors addObjectsFromArray:colors];
        }
        return self;
    };
}

- (AlphaKer *(^)(NSArray *))arrayLocs {
    return ^ (NSArray *locs) {
        if (locs) {
            self.locs = [NSMutableArray arrayWithArray:locs];
        }
        return self;
    };
}

- (AlphaKer *(^)(CGPoint))addStartPoint {
    return ^ (CGPoint point) {
        _startPoint = point;
        return self;
    };
}

- (AlphaKer *(^)(CGPoint))addEndPoint {
    return ^ (CGPoint point) {
        _endPoint = point;
        return self;
    };
}

@end
