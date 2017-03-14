//
//  UIImageView+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIImageView+SYBuilder.h"

@implementation UIImageView (SYBuilder)

- (SYPropertyUIImageViewObjectBlock)img {
    return ^ (id img) {
        if ([img isKindOfClass:[UIImage class]]) {
            self.image = img;
        }
        return self;
    };
}

- (SYPropertyUIImageViewIntBlock)mode {
    return ^ (NSInteger mode) {
        self.contentMode = mode;
        return self;
    };
}

@end
