//
//  SYUnReadView.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UnReadCountStyle) {
    UnReadCountStyleRedPoint = 1,
    UnReadCountStyleUnReadCount = 2
};

//未读信息控件
@interface SYUnReadView : UILabel

/**
 设置未读数和样式
 @param count 未读数，当style==UnReadCountStyleRedPoint时可以为0
 @param style UnReadCountStyle样式 > UnReadCountStyleRedPoint未读红点 UnReadCountStyleUnReadCount未读数
 */
- (void)setUnReadCount:(int)count style:(UnReadCountStyle)style;

@end
