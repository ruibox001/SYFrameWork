//
//  SFUIBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYUIBuilder.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation SYUIBuilder

+ (UIButton *)createButtonWithType:(UIButtonType)type
                             frame:(CGRect)frame
                       imageNormal:(id)imageNormal
                       imageSelect:(id)imageSelect
                            target:(id)target
                            action:(SEL)action
{
    UIImage *imageN;
    UIImage *imageS;
    if(imageNormal && [imageNormal isKindOfClass:[NSString class]]){
         imageN = [UIImage imageNamed:imageNormal];
    }else{
        imageN = imageNormal;
    }
    
    if(imageSelect && [imageSelect isKindOfClass:[NSString class]]){
        imageS = [UIImage imageNamed:imageSelect];
    }else{
        imageS = imageSelect;
    }
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if(imageN) [button setImage:imageN forState:UIControlStateNormal];
    if(imageS) [button setImage:imageS forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)createButtonWithType:(UIButtonType)type
                             frame:(CGRect)frame
                        normalTitle:(NSString *)normalTitle
                        selectTitle:(NSString *)selectTitle
                        normalColor:(UIColor *)normalColor
                        selectColor:(UIColor *)selectColor
                   backgroundColor:(UIColor *)backgroundColor
                          fontSize:(CGFloat)fontSize
                             target:(id)target
                             action:(SEL)action
{
    if(normalColor == nil) normalColor = [UIColor clearColor];
    if(selectColor == nil) selectColor = [UIColor clearColor];
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitle:selectTitle forState:UIControlStateSelected];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectColor forState:UIControlStateSelected];
    if(backgroundColor) button.backgroundColor = backgroundColor;
    if(fontSize > 0) button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return button;
}


+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                   userInteractionEnabled:(BOOL)userInteractionEnabled

{
    UIImageView *img = [[UIImageView alloc] initWithFrame:frame];
    img.userInteractionEnabled = userInteractionEnabled;
    img.contentMode = contenMode;
    if(image && [image isKindOfClass:[NSString class]])
    {
        image = [UIImage imageNamed:image];
    }
    img.image = image;
    return img;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                                   target:(id)target
                                   action:(SEL)action
{
    UIImageView *imgView = [self createImageViewWithFrame:frame image:image contenMode:contenMode userInteractionEnabled:YES];
    if(target && action)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [imgView addGestureRecognizer:tap];
    }
    return imgView;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                                    image:(id)image
                               contenMode:(UIViewContentMode)contenMode
                                   target:(id)target
                                   action:(SEL)action
                             cornerRadius:(CGFloat)cornerRadius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
{
    UIImageView *img = [self createImageViewWithFrame:frame image:image contenMode:contenMode target:target action:action];
    img.layer.cornerRadius = cornerRadius;
    img.layer.borderWidth = borderWidth;
    if(borderColor) img.layer.borderColor = borderColor.CGColor;
    img.layer.masksToBounds = YES;
    return img;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                         fontSize:(CGFloat)fontSize
                    textAlignment:(NSTextAlignment)textAlignment
                        textColor:(UIColor *)textColor
                  backgroundColor:(UIColor *)backgroundColor
{
    if(backgroundColor == nil) backgroundColor = [UIColor clearColor];
    UILabel *lb = [[UILabel alloc] initWithFrame:frame];
    lb.text = title;
    lb.textColor = textColor;
    lb.textAlignment = textAlignment;
    if(fontSize > 0) lb.font = [UIFont systemFontOfSize:fontSize];
    lb.backgroundColor = backgroundColor;
    return lb;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                            title:(NSString *)title
                         fontSize:(CGFloat)fontSize
                    textAlignment:(NSTextAlignment)textAlignment
                        textColor:(UIColor *)textColor
                  backgroundColor:(UIColor *)backgroundColor
                     cornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
{
    UILabel *lbTitle = [self createLabelWithFrame:frame title:title fontSize:fontSize textAlignment:textAlignment textColor:textColor backgroundColor:backgroundColor];
    lbTitle.layer.cornerRadius = cornerRadius;
    lbTitle.layer.borderWidth= borderWidth;
    if(borderColor) lbTitle.layer.borderColor = borderColor.CGColor;
    return lbTitle;
}


+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor
{
    UITextField *tf = [[UITextField alloc] initWithFrame:frame];
    tf.placeholder = placeHolder;
    tf.delegate = delegate;
    tf.textColor = textColor;
    tf.backgroundColor =backgroundColor;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    return tf;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor
                             cornerRadius:(CGFloat)cornerRadius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
{
    UITextField *tf = [self createTextFieldWithFrame:frame
                                          placeHoder:placeHolder
                                            delegate:delegate
                                           textColor:textColor
                                     backgroundColor:backgroundColor];
    
    tf.layer.cornerRadius = cornerRadius;
    tf.layer.borderWidth = borderWidth;
    if(borderColor) tf.layer.borderColor = borderColor.CGColor;
    return tf;
}


+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                               placeHoder:(NSString *)placeHolder
                                 delegate:(id)delegate
                                textColor:(UIColor *)textColor
                          backgroundColor:(UIColor *)backgroundColor
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
                            leftViewWidth:(CGFloat)leftViewWidth
                                 leftView:(UIView *)lView
{
    UITextField *tf = [self createTextFieldWithFrame:frame
                                          placeHoder:placeHolder
                                            delegate:delegate
                                           textColor:textColor
                                     backgroundColor:backgroundColor
                                        cornerRadius:0
                                         borderWidth:borderWidth
                                         borderColor:borderColor];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftViewWidth, frame.size.height)];
    tf.leftView = leftView;
    tf.leftViewMode = UITextFieldViewModeAlways;
    
    if(lView){
        lView.center = CGPointMake(leftViewWidth/ 2, frame.size.height/2);
         [leftView addSubview:lView];
    }
    
    return tf;
}


+ (UITableView *)createTableViewWithFrame:(CGRect)frame
                                 delegate:(id)delegate
                               dataSource:(id)dataSource
                          backgroundColor:(UIColor *)backgroundColor
                           showHeaderLine:(BOOL)showHeaderLine
                           showFooterLine:(BOOL)showFooterLine
                                    style:(UITableViewStyle)style
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:frame style:style];
    tableview.delegate = delegate;
    tableview.dataSource = dataSource;
    tableview.backgroundColor = backgroundColor;
    tableview.showsVerticalScrollIndicator = NO;
    tableview.showsHorizontalScrollIndicator = NO;
    if(!showHeaderLine) tableview.tableHeaderView = [UIView new];
    if(!showFooterLine) tableview.tableFooterView = [UIView new];
    return tableview;
}

+ (UITableView *)createTableViewWithFrame:(CGRect)frame
                                 delegate:(id)delegate
                               dataSource:(id)dataSource
                          backgroundColor:(UIColor *)backgroundColor
                           showHeaderLine:(BOOL)showHeaderLine
                           showFooterLine:(BOOL)showFooterLine
                           separatorInset:(UIEdgeInsets)separatorInset
                                    style:(UITableViewStyle)style
{
    UITableView *tableview = [self createTableViewWithFrame:frame delegate:delegate dataSource:dataSource backgroundColor:backgroundColor showHeaderLine:showHeaderLine showFooterLine:showFooterLine style:style];
    tableview.separatorInset = separatorInset;
    return tableview;
}

#pragma mark - UIScrollView
+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                                   delegate:(id)delegate
                                    bounces:(BOOL)bounces
                              scrollEnabled:(BOOL)scrollEnabled
               showsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
             showsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator

{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.delegate = delegate;
    scrollView.bounces = bounces;
    scrollView.scrollEnabled = scrollEnabled;
    scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
    scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    return scrollView;
}

#pragma mark - UISwitch
+ (UISwitch *)createSwitchWithFrame:(CGRect)frame
                             target:(id)target
                             action:(SEL)action
{
    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:frame];
    [mySwitch addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return mySwitch;
}

+ (UIView *)createViewWithFrame:(CGRect)frame
                backgroundColor:(UIColor *)backgroundColor
                         target:(id)target
                         action:(SEL)action
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    if(target && action)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [view addGestureRecognizer:tap];
    }
    return view;
}

+ (UISearchBar *)createSearchBar:(CGRect)frame
                        delegate:(id)delegate
                     placeholder:(NSString *)placeholder
                        tintColor:(UIColor *)tintColor
                 backgroundImage:(UIImage *)backgroundImage
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:frame];
    searchBar.placeholder = placeholder;
    searchBar.delegate = delegate;
    [searchBar setBarTintColor:tintColor];
    [searchBar setBackgroundImage:backgroundImage];
    return searchBar;
}

+ (UIView *)createLineViewWithHeight:(CGFloat)height {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    lineView.backgroundColor = [UIColor grayColor];
    return lineView;
}

@end
