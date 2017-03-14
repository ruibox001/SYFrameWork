//
//  SYTabBarModel.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYTabBarModel : NSObject

@property (strong, nonatomic) NSString          *tarBarImageNormal; //未选中图片名称
@property (strong, nonatomic) NSString          *tarBarImagePress;  //选中图片名称
@property (strong, nonatomic) NSString          *tarBarName;        //tarBar名称
@property (assign, nonatomic) int          tarBarUnReadCount;       //tarBar未读数

@property (strong, nonatomic) UIColor *tarBarSelectColor;           //tarBar选中颜色
@property (strong, nonatomic) UIColor *tarBarUnSelectColor;         //tarBar未选中颜色

@end
