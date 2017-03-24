//
//  SYMoveView.h
//  Simei
//
//  Created by 王声远 on 16/5/20.
//  Copyright © 2016年 创美汇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMoveView : UIView

+ (instancetype)startWithFrame:(CGRect)frame content:(NSString *)content textColor:(UIColor *)textColor font:(UIFont *)font;
- (void)stopMove;

/**
 CGRect rect = CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width-40, 44);
 SFMoveView *mv = [SFMoveView startWithFrame:rect content:@"数据库升级市司法局速度快放假时间发送司法解释看风景时刻就是看风景时看风景时间圣诞节疯狂送积分看数据库升级" textColor:[UIColor greenColor] font:[UIFont systemFontOfSize:16]];
 [self.view addSubview:mv];
 */

@end
