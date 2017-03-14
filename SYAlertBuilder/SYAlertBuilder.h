//
//  SYAlertBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^alertClickBlock)(UIAlertAction *action);

#define AlertBuild SYAlertBuilder

#define Alert     AlertMaker(UIAlertControllerStyleAlert)
#define Sheet     AlertMaker(UIAlertControllerStyleActionSheet)

@interface SYAlertBuilder : NSObject

/**
 构建器
 @return 构建器
 */
AlertBuild *AlertMaker(UIAlertControllerStyle style);

/**
 构建最终显示
 @return 构建器
 */
- (AlertBuild *(^)(UIViewController *))show;

/**
 构建title
 @return 构建器
 */
- (AlertBuild *(^)(NSString *))title;

/**
 构建message
 @return 构建器
 */
- (AlertBuild *(^)(NSString *))message;

/**
 构建okAction
 @return 构建器
 */
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))okActionStyle;
- (AlertBuild *(^)(NSString *,void (^)()))okAction;

/**
 构建cancelAction
 @return 构建器
 */
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))cancelActionStyle;
- (AlertBuild *(^)(NSString *,void (^)()))cancelAction;


/**
 添加构建的Action
 @return 构建器
 */
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))addActionStyle;
- (AlertBuild *(^)(NSString *,void (^)()))addAction;

/**
 调用方式例子
 AlertMaker().title(@"这里标题").message(@"这里内容").style(UIAlertControllerStyleAlert).cancelAction(@"取消",UIAlertActionStyleDefault,nil).addAction(@"Action",UIAlertActionStyleDefault,nil).show(self);
*/

@end
