//
//  SYTabBarController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYTabBarButtonItem.h"
#import "SYTabBarModel.h"
#import "SYUnReadView.h"

@implementation SYTabBarButtonItem

- (id)initWithFrame:(CGRect)frame itemInfo:(SYTabBarModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        _model = model;
        
        UIImage *image = [UIImage imageNamed:model.tarBarImageNormal];
        CGFloat imageW = image.size.width;
        CGFloat imageH = image.size.height;
        self.titleImageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-imageW)/2, 5.5, imageW, imageH)];
        [self.titleImageView setImage:image];
        [self addSubview:self.titleImageView];

        self.msgCountLabel = [[SYUnReadView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.msgCountLabel.center = CGPointMake(self.titleImageView.frame.origin.x+self.titleImageView.frame.size.width+3, self.titleImageView.frame.origin.y+8);
        [self addSubview:self.msgCountLabel];
        [self.msgCountLabel setUnReadCount:model.tarBarUnReadCount style:UnReadCountStyleUnReadCount];
        
        self.titleTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleImageView.frame.origin.y+self.titleImageView.frame.size.height+4, frame.size.width, 12)];
        [self.titleTextLabel setText:model.tarBarName];
        [self.titleTextLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleTextLabel setBackgroundColor:[UIColor clearColor]];
        [self.titleTextLabel setTextColor:model.tarBarUnSelectColor];
        [self.titleTextLabel setFont:[UIFont boldSystemFontOfSize:12.0]];
        [self addSubview:self.titleTextLabel];
    }
    return self;
}

- (void) setSelected:(BOOL)selected
{
    if (selected) {
        [self.titleImageView setImage:[UIImage imageNamed:_model.tarBarImagePress]];
        [self.titleTextLabel setTextColor:self.model.tarBarSelectColor];
    }
    else
    {
        [self.titleImageView setImage:[UIImage imageNamed:_model.tarBarImageNormal]];
        [self.titleTextLabel setTextColor:self.model.tarBarUnSelectColor];
    }
}

- (void) reloadData
{
    [self.msgCountLabel setUnReadCount:self.model.tarBarUnReadCount style:UnReadCountStyleUnReadCount];
}

@end
