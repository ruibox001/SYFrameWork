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

@interface SYAlertBuilder : NSObject


/**
 构建AlertBuilder
 @return 构建器
 */
AlertBuild *AlertMaker();

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
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)(UIAlertAction *action)))okAction;

/**
 构建cancelAction
 @return 构建器
 */
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)(UIAlertAction *action)))cancelAction;

/**
 构建style
 @return 构建器
 */
- (AlertBuild *(^)(UIAlertControllerStyle))style;

/**
 添加构建的Action
 @return 构建器
 */
- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)(UIAlertAction *action)))addAction;

/**
 调用方式例子
 AlertMaker().title(@"这里标题").message(@"这里内容").style(UIAlertControllerStyleAlert).cancelAction(@"取消",UIAlertActionStyleDefault,nil).addAction(@"Action",UIAlertActionStyleDefault,nil).show(self);
*/

@end
