//
//  SFHandleNavigationBar.h
//  SofficeMoi
//
//  Created by Eayon on 5/14/15.
//  Copyright (c) 2015 Soffice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^NavButtonClickBlock)();

@interface SYNavigationTool : NSObject

- (void)addTitle:(NSString *)title ctl:(UIViewController *)ctl titleColor:(UIColor *)titleColor;

- (void)addLeft:(id)left ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block;

- (void)addRight:(id)right ctl:(UIViewController *)ctl tintColor:(UIColor *)color clickBlock:(NavButtonClickBlock)block;

@end
