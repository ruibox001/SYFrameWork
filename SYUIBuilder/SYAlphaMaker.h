//
//  SYAlphaMaker.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SYAlphaMaker;

#define AlphaKer SYAlphaMaker

@interface SYAlphaMaker : NSObject

@property (strong, nonatomic) NSMutableArray *alphaColors;

@property (assign, nonatomic, readonly) CGPoint startPoint;

@property (assign, nonatomic, readonly) CGPoint endPoint;

AlphaKer *alphader();

- (AlphaKer *(^)(UIColor *))addColor;

- (AlphaKer *(^)(NSArray *))arrayColors;

- (AlphaKer *(^)(CGPoint))addStartPoint;

- (AlphaKer *(^)(CGPoint))addEndPoint;

@end
