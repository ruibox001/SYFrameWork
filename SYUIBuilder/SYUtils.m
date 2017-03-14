//
//  SYUtils.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYUtils.h"

@implementation SYUtils

+ (UIColor *)colorWithColorObject:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        
        CGFloat alpha = 1;
        NSArray *componnets = [object componentsSeparatedByString:@","];
        if (componnets.count == 2) {
            NSRange range = [object rangeOfString:@"," options:NSBackwardsSearch];
            alpha = [[object substringFromIndex:range.location + range.length] floatValue];
            alpha = MIN(alpha, 1);
            object = [object substringToIndex:range.location];
            UIColor *color = [self colorWithHex:object];
            color = [color colorWithAlphaComponent:alpha];
            return color;
        }
        return [self colorWithHex:object];
    }
    return [UIColor clearColor];
}

+(UIColor *) colorWithHex: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIViewController *)getVisibleViewController {
    UIWindow *window = [UIApplication sharedApplication ].delegate.window;
    UIViewController *rootViewController = window.rootViewController;
    return [self getVisibleViewController:rootViewController];
}

+ (UIViewController *)getVisibleViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        
        return [self getVisibleViewController:lastViewController];
    }
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UIViewController *selectedViewController = tabBarController.selectedViewController;
        
        return [self getVisibleViewController:selectedViewController];
    }
    
    if (rootViewController.presentedViewController != nil) {
        UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
        return [self getVisibleViewController:presentedViewController];
    }
    
    return rootViewController;
}

@end
