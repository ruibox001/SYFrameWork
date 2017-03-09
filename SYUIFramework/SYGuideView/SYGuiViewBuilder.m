//
//  SYGuiViewBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYGuiViewBuilder.h"
#import "SYGuideView.h"

@interface SYGuiViewBuilder()

/**
 引导页实现类
 */
@property (nonatomic,strong) SYGuideView *guideView;

@property (nonatomic,copy) void (^guideBtnClick)();

@end

@implementation SYGuiViewBuilder

GuiViewBuilder *guiViewBuilder(){
    static GuiViewBuilder *m = nil;
    if (!m) {
        m = GuiViewBuilder.new;
        m.guideView = [[SYGuideView alloc] init];
    }
    [m.guideView.guideImages removeAllObjects];
    return m;
}

/**
 构建显示引导页
 @return 构建器
 */
- (GuiViewBuilder *(^)())show {
    return ^id(){
        [self buildGuiView];
        return self;
    };
}

/**
 构建体验按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(UIButton *,void (^)()))button {
    return ^id(UIButton *button,void (^btnClickBlock)()){
        self.guideView.guideBtn = button;
        self.guideBtnClick = btnClickBlock;
        return self;
    };
}

/**
 体验按钮距离底部位置
 @return 构建器
 */
- (GuiViewBuilder *(^)(CGFloat))btnBottonOffset {
    return ^id(CGFloat btnOffset){
        self.guideView.guideBtnBottonOffset = btnOffset;
        return self;
    };
}

/**
 引导页图片数据
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSArray *))images {
    return ^id(NSArray * images){
        [self.guideView.guideImages addObjectsFromArray:images];
        return self;
    };
}

/**
 引导页图片数据
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSString *))addImageName {
    return ^id(NSString * addImageName){
        [self.guideView.guideImages addObject:addImageName];
        return self;
    };
}

/**
 自定义构建体验图片按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSString *,void (^)()))createImageBtn {
    return ^id(NSString * imageName,void (^btnClickBlock)()){
        self.guideBtnClick = btnClickBlock;
        self.guideView.guideBtn = [self createBtnWithImageName:imageName];
        return self;
    };
}

/**
 自定义构建体验按钮
 @return 构建器
 */
- (GuiViewBuilder *(^)(NSString *,UIColor *,UIColor *,CGFloat,CGSize,CGFloat,void (^)()))createBtn {
    return ^id(NSString * title,UIColor *titleColor,UIColor *bgColor,CGFloat radius,CGSize size,CGFloat fontSize,void (^btnClickBlock)()){
        self.guideBtnClick = btnClickBlock;
        self.guideView.guideBtn = [self createBtnWithTitle:title titleColor:titleColor bgColor:bgColor btnRadius:radius btnSize:size fontSize:fontSize];
        return self;
    };
}

- (UIButton *)createBtnWithTitle:(NSString *)title titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor btnRadius:(CGFloat)radius btnSize:(CGSize)size fontSize:(CGFloat)fontSize{
    if(titleColor == nil) titleColor = [UIColor whiteColor];
    if(bgColor == nil) bgColor = [UIColor blueColor];
    if (!title || title.length == 0) {
        title = @"立即体验";
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, size.width, size.height);
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = bgColor;
    if(fontSize > 0) button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    if (radius > 0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:radius];
        [button.layer setBorderWidth:0];
        [button.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    return button;
}

- (UIButton *)createBtnWithImageName:(NSString *)imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    return button;
}

- (void)btnClick {
    if (self.guideBtnClick) {
        self.guideBtnClick();
    }
    [self.guideView removeAllViews];
    self.guideView = nil;
}

- (void)buildGuiView {
    if (!self.guideView) {
        self.guideView = [[SYGuideView alloc] init];
    }
    [self.guideView show];
}

@end
