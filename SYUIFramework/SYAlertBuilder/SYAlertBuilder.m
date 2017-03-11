//
//  SYAlertBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYAlertBuilder.h"

@interface SYAlertBuilder()

@property (nonatomic,weak) UIViewController *superController;
@property (nonatomic,strong) NSString *alertTitle;
@property (nonatomic,strong) NSString *alertMessage;

@property (nonatomic,assign) UIAlertControllerStyle alertStyle;
@property (nonatomic,strong) NSMutableArray *actions;

@end

@implementation SYAlertBuilder


AlertBuild *AlertMaker(UIAlertControllerStyle style){
    static  AlertBuild *m = nil;
    if (!m) {
        m = AlertBuild.new;
    }
    if (m) {
        [m.actions removeAllObjects];
        m.alertStyle = style;
        m.superController = nil;
        m.alertTitle = nil;
        m.alertMessage = nil;
    }
    return m;
}

- (AlertBuild *(^)(UIViewController *))show {
    return ^id(UIViewController *controller){
        
        self.superController = controller;
        if (self.superController) {
            [self installAlert];
        }
        return self;
    };
}


- (AlertBuild *(^)(NSString *))title {
    return ^id(NSString * title){
        self.alertTitle = title;
        return self;
    };
}

- (AlertBuild *(^)(NSString *))message {
    return ^id(NSString * message){
        self.alertMessage = message;
        return self;
    };
}

- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))okActionStyle {
    return ^id(NSString * okBtn,UIAlertActionStyle style,void (^alertClickBlock)()){
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okBtn style:style handler:alertClickBlock];
        [self.actions addObject:okAction];
        return self;
    };
}

- (AlertBuild *(^)(NSString *,void (^)()))okAction {
    return ^id(NSString * okBtn,void (^alertClickBlock)()){
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okBtn style:UIAlertActionStyleDefault handler:alertClickBlock];
        [self.actions addObject:okAction];
        return self;
    };
}

- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))cancelActionStyle {
    return ^id(NSString * cancelBtn,UIAlertActionStyle style,void (^alertClickBlock)()){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtn style:style handler:alertClickBlock];
        [self.actions addObject:cancelAction];
        return self;
    };
}

- (AlertBuild *(^)(NSString *,void (^)()))cancelAction {
    return ^id(NSString * cancelBtn,void (^alertClickBlock)()){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtn style:UIAlertActionStyleDefault handler:alertClickBlock];
        [self.actions addObject:cancelAction];
        return self;
    };
}

- (AlertBuild *(^)(NSString *,UIAlertActionStyle,void (^)()))addActionStyle {
    return ^id(NSString *title,UIAlertActionStyle style,void (^alertClickBlock)()){
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:alertClickBlock];
        [self.actions addObject:action];
        return self;
    };
}

- (AlertBuild *(^)(NSString *,void (^)()))addAction {
    return ^id(NSString *title,void (^alertClickBlock)()){
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:alertClickBlock];
        [self.actions addObject:action];
        return self;
    };
}

- (NSMutableArray *)actions {
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}

- (void) installAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.alertTitle message:self.alertMessage preferredStyle:self.alertStyle];
    for (UIAlertAction *action in self.actions) {
        [alertController addAction:action];
    }
    [self.superController presentViewController:alertController animated:YES completion:nil];
}

@end
