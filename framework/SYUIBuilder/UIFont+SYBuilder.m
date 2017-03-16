//
//  UIFont+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UIFont+SYBuilder.h"

@implementation UIFont (SYBuilder)

+ (UIFont *)fontWithObject:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [UIFont systemFontOfSize:[object floatValue]];
    }
    return [UIFont systemFontOfSize:14];
}

+ (UIFont *)fontWithBoldObject:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [UIFont boldSystemFontOfSize:[object floatValue]];
    }
    return [UIFont boldSystemFontOfSize:14];
}

@end
