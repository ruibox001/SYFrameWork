//
//  UnlockView.m
//  Unlock
//
//  Created by 王声远 on 15/5/16.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import "SFTitleIconView.h"
#import "SFTitleIconBtn.h"

@interface SFTitleIconView()

@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIFont *titleFont;
@property (copy, nonatomic) void (^LineBtnClickBlock)(NSInteger index);
@property (nonatomic,strong) NSMutableArray *datas;

@end

@implementation SFTitleIconView

- (void)addButtonWithArray:(NSArray *)datas frame:(CGRect)frame
{
    if (!datas || datas.count == 0) {
        return;
    }
    
    for (int i = 0; i < datas.count; i ++) {
        
        id obj = datas[i];
        if (![obj isKindOfClass:[SFTitleIconModel class]]) {
            NSAssert(nil,@"按钮数据里必须使用SFTitleIconModel对象构建");
        }
        
        SFTitleIconModel *model = obj;
        CGFloat btnW = frame.size.width/datas.count;
        CGFloat btnH = frame.size.height;
        CGRect btnFrame = CGRectMake(i*btnW, 0, btnW, btnH);
        
        UIImage *img = [UIImage imageNamed:model.icon];
        CGFloat imgHW = img.size.width;
        CGFloat scaleH = frame.size.height/8.0;
        
        CGRect imgRect = CGRectMake((btnW-imgHW)*0.5, scaleH, imgHW, imgHW);
        CGRect titleRect = CGRectMake(0, CGRectGetMaxY(imgRect)+6, btnW, 15);
        
        SFTitleIconBtn *btn = [SFTitleIconBtn shareWithFrame:btnFrame titleRect:titleRect iconRect:imgRect];
        [self addSubview:btn];
        
        btn.tag = i;
        [btn setImage:img forState:UIControlStateNormal];
        [btn setTitle:model.title forState:UIControlStateNormal];

        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = self.titleFont;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;

        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (SFTitleIconView *(^)(NSString *, NSString *))addTitleIcon {
    return ^ (NSString *title, NSString *icon) {
        SFTitleIconModel *m = [SFTitleIconModel shareWithIcon:icon title:title];
        [self.datas addObject:m];
        return self;
    };
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addButtonWithArray:self.datas frame:self.frame];
}

- (SFTitleIconView *(^)(void (^)(NSInteger index)))click {
    return ^ (void (^lineBtnClickBlock)(NSInteger index)) {
        self.LineBtnClickBlock = lineBtnClickBlock;
        return self;
    };
}

- (void)btnClick:(UIButton *)btn
{
    if (self.LineBtnClickBlock) {
        self.LineBtnClickBlock(btn.tag);
    }
}

- (UIColor *)titleColor {
    if (!_titleColor) {
        _titleColor = [UIColor grayColor];
    }
    return _titleColor;
}

- (UIFont *)titleFont {
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:14];
    }
    return _titleFont;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
