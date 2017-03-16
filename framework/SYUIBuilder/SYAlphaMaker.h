//
//  SYAlphaMaker.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define AlphaKer SYAlphaMaker

#define startPoint(...)   addStartPoint((SYPoint){__VA_ARGS__})
#define endPoint(...)   addEndPoint((SYPoint){__VA_ARGS__})

@interface SYAlphaMaker : NSObject

@property (strong, nonatomic) NSMutableArray *alphaColors;

@property (strong, nonatomic) NSMutableArray *locs;

@property (assign, nonatomic, readonly) CGPoint sPoint;

@property (assign, nonatomic, readonly) CGPoint ePoint;

AlphaKer *alphaBuilder();

/**
 添加渐变颜色
 */
- (AlphaKer *(^)(UIColor *))addColor;

/**
 添加渐变颜色数组
 */
- (AlphaKer *(^)(NSArray *))arrayColors;

/**
 添加渐变位置点数组，默认[0, 1.0]
 */
- (AlphaKer *(^)(NSArray *))arrayLocs;

/**
 添加渐变起点
 */
- (AlphaKer *(^)(SYPoint))addStartPoint;

/**
 添加结束起点
 */
- (AlphaKer *(^)(SYPoint))addEndPoint;

@end
