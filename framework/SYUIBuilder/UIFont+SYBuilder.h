//
//  UIFont+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Fnts(x)  [UIFont fontWithObject:x]
#define Fntb(x)  [UIFont fontWithBoldObject:x]

@interface UIFont (SYBuilder)

+ (UIFont *)fontWithObject:(id)object;

+ (UIFont *)fontWithBoldObject:(id)object;

@end
