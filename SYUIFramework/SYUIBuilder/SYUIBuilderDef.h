//
//  SYUIBuilderDef.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/13.
//  Copyright © 2017年 王声远. All rights reserved.
//

#ifndef SYUIBuilderDef_h
#define SYUIBuilderDef_h

#import <objc/objc.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

typedef struct SYRect {
    CGRect value;
} SYRect;


/**
 * 定义各个控件的属性链试调用block
 */
#define SY_UI_PROP_TYPE(v, t)       typedef v *(^SYProperty##v##t##Block)
#define SY_GENERATE_PROP_TYPES(x) \
SY_UI_PROP_TYPE(x, Empty)();\
SY_UI_PROP_TYPE(x, Int)(NSInteger);\
SY_UI_PROP_TYPE(x, Rect)(SYRect);\
SY_UI_PROP_TYPE(x, Object)(id);\
SY_UI_PROP_TYPE(x, TwoObject)(id, id);\
SY_UI_PROP_TYPE(x, ThreeObject)(id, id, id);\
SY_UI_PROP_TYPE(x, TargetSel)(id, SEL);\
SY_UI_PROP_TYPE(x, Func)(SEL);\
SY_UI_PROP_TYPE(x, Float)(CGFloat);\
SY_UI_PROP_TYPE(x, Point)(CGPoint);\
SY_UI_PROP_TYPE(x, Size)(CGSize);\
SY_UI_PROP_TYPE(x, CallBack)(id);

SY_GENERATE_PROP_TYPES(UILabel);
SY_GENERATE_PROP_TYPES(UIButton);
SY_GENERATE_PROP_TYPES(UIImageView);
SY_GENERATE_PROP_TYPES(UITextField);
SY_GENERATE_PROP_TYPES(UITextView);
SY_GENERATE_PROP_TYPES(UITableView);
SY_GENERATE_PROP_TYPES(UIScrollView);
SY_GENERATE_PROP_TYPES(UIView);
SY_GENERATE_PROP_TYPES(UISwitch);


/**
 定义UI属性
 */
#define SY_READONLY                      @property (nonatomic, readonly)
#define SY_UIPROP_TYPE(x,y)              SY_READONLY SYProperty##x##y##Block

#define SY_UILABEL_PROP(y)               SY_UIPROP_TYPE(UILabel, y)
#define SY_UIBUTTON_PROP(y)              SY_UIPROP_TYPE(UIButton, y)
#define SY_UIIMAGEVIEW_PROP(y)           SY_UIPROP_TYPE(UIImageView, y)
#define SY_UITEXTFIELD_PROP(y)           SY_UIPROP_TYPE(UITextField, y)
#define SY_UITEXTVIEW_PROP(y)            SY_UIPROP_TYPE(UITextView, y)
#define SY_UITABLEVIEW_PROP(y)           SY_UIPROP_TYPE(UITableView, y)
#define SY_UISCROLLVIEW_PROP(y)          SY_UIPROP_TYPE(UIScrollView, y)
#define SY_UIVIEW_PROP(y)                SY_UIPROP_TYPE(UIView, y)
#define SY_UISWITCH_PROP(y)              SY_UIPROP_TYPE(UISwitch, y)


/**
 返回属性block
 */
#define SY_DO_BLOCK(x, ...) return ^(x value) {__VA_ARGS__; return self;}
#define SY_EMPTY_BLOCK(...)        return ^{__VA_ARGS__; return self;}
#define SY_OBJECT_BLOCK(...)       SY_DO_BLOCK(id, __VA_ARGS__)
#define SY_INT_BLOCK(...)          SY_DO_BLOCK(NSInteger, __VA_ARGS__)
#define SY_FLOAT_BLOCK(...)        SY_DO_BLOCK(CGFloat, __VA_ARGS__)
#define SY_RECT_BLOCK(...)         SY_DO_BLOCK(SYRect, __VA_ARGS__)
#define SY_FUNC_BLOCK(...)         SY_DO_BLOCK(SEL, __VA_ARGS__)

#define SY_CALLBACK_BLOCK(...)     return ^(id target, id object) {__weak id weakTarget = target; __weak id weakSelf = self; __VA_ARGS__; weakTarget = nil; weakSelf = nil; return self;}


#define SY_DOS_BLOCK(t)  return ^() {t(); return self;}

#endif /* SYUIBuilderDef_h */
