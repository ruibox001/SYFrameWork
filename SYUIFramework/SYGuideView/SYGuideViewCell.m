//
//  SYGuideViewCell.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYGuideViewCell.h"

@implementation SYGuideViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.layer.masksToBounds = YES;
    self.imageView = [[UIImageView alloc]initWithFrame:kGuideViewBounds];
    self.imageView.center = CGPointMake(kGuideViewBounds.size.width / 2, kGuideViewBounds.size.height / 2);
    [self.contentView addSubview:self.imageView];
}

- (void)setBtn:(UIButton *)btn{
    _btn = btn;
    [self.contentView addSubview:btn];
    CGRect frame = btn.frame;
    frame.origin.x = (kGuideViewBounds.size.width - frame.size.width)*0.5;
    frame.origin.y = kGuideViewBounds.size.height - frame.size.height - self.guideBtnBottonOffset;
    [btn setFrame:frame];
}

@end
