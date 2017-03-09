//
//  SFUIBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYUIBuilder : NSObject

#pragma mark - UIButton
+ (UIButton *)createButtonWithType:(UIButtonType)type
                             frame:(CGRect)frame
                       imageNormal:(id)imageNormal
                       imageSelect:(id)imageSelect
                            target:(id)target
                            action:(SEL)action;

+ (UIButton *)createButtonWithType:(UIButtonType)type
                             frame:(CGRect)frame
                       normalTitle:(NSString *)normalTitle
                       selectTitle:(NSString *)selectTitle
                       normalColor:(UIColor *)normalColor
                       selectColor:(UIColor *)selectColor
                   backgroundColor:(UIColor *)backgroundColor
                          fontSize:(CGFloat)fontSize
                            target:(id)target
                            action:(SEL)action;

#pragma mark - UIImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                   userInteractionEnabled:(BOOL)userInteractionEnabled;

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                                   target:(id)target
                                   action:(SEL)action;

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                                   target:(id)target
                                   action:(SEL)action
                             cornerRadius:(CGFloat)cornerRadius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor;

#pragma mark - UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                         fontSize:(CGFloat)fontSize
                    textAlignment:(NSTextAlignment)textAlignment
                        textColor:(UIColor *)textColor
                  backgroundColor:(UIColor *)backgroundColor;

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                         fontSize:(CGFloat)fontSize
                    textAlignment:(NSTextAlignment)textAlignment
                        textColor:(UIColor *)textColor
                  backgroundColor:(UIColor *)backgroundColor
                     cornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor;

#pragma mark - UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor
                             cornerRadius:(CGFloat)cornerRadius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
                            leftViewWidth:(CGFloat)leftViewWidth
                                 leftView:(UIView *)leftView;

#pragma mark - UITableView
+ (UITableView *)createTableViewWithFrame:(CGRect)frame
                                 delegate:(id)delegate
                               dataSource:(id)dataSource
                          backgroundColor:(UIColor *)backgroundColor
                           showHeaderLine:(BOOL)showHeaderLine
                           showFooterLine:(BOOL)showFooterLine
                                    style:(UITableViewStyle)style;

+ (UITableView *)createTableViewWithFrame:(CGRect)frame
                                 delegate:(id)delegate
                               dataSource:(id)dataSource
                          backgroundColor:(UIColor *)backgroundColor
                           showHeaderLine:(BOOL)showHeaderLine
                           showFooterLine:(BOOL)showFooterLine
                           separatorInset:(UIEdgeInsets)separatorInset
                                    style:(UITableViewStyle)style;

#pragma mark - UIScrollView

+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                                   delegate:(id)delegate
                                    bounces:(BOOL)bounces
                              scrollEnabled:(BOOL)scrollEnabled
               showsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
             showsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator;

#pragma mark - UISwitch

+ (UISwitch *)createSwitchWithFrame:(CGRect)frame
                             target:(id)target
                             action:(SEL)action;

#pragma mark - UIView
+ (UIView *)createViewWithFrame:(CGRect)frame
                backgroundColor:(UIColor *)backgroundColor
                         target:(id)target
                         action:(SEL)action;

+ (UIView *)createLineViewWithHeight:(CGFloat)height;

#pragma mark - UISearchBar
+ (UISearchBar *)createSearchBar:(CGRect)frame
                        delegate:(id)delegate
                     placeholder:(NSString *)placeholder
                       tintColor:(UIColor *)tintColor
                 backgroundImage:(UIImage *)backgroundImage;
@end
