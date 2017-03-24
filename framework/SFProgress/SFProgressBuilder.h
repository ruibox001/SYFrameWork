//
//  SFProgressBuilder.h
//  DDG
//
//  Created by 王声远 on 17/3/24.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFProgressView.h"

#define progressBuilder progressMaker()

@interface SFProgressBuilder : SFProgressView

SFProgressBuilder *progressMaker();

- (SFProgressBuilder *(^)(UIColor *))progressBgColor ;

- (SFProgressBuilder *(^)(CGFloat))progressRadius ;

- (SFProgressBuilder *(^)(id))progressyColor ;

- (SFProgressBuilder *(^)(CGFloat))setProgress ;

- (SFProgressBuilder *(^)(UIView *))showInVIew;

- (SFProgressBuilder *(^)(CGRect))withFrame;

/**
 *使用
 SFProgressView *v = progressBuilder.progressBgColor([UIColor greenColor]).progressyColor(@[[UIColor redColor],[UIColor lightGrayColor]]).showInVIew(self.view).withFrame(CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width-40, 5));
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 v.progress = 0.9;
 });
 */

@end
