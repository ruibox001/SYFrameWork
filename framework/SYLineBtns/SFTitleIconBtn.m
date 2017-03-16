//
//  SFTitleIconBtn.m
//  Tronker
//
//  Created by 王声远 on 17/3/4.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFTitleIconBtn.h"

@interface SFTitleIconBtn()

@property (nonatomic,assign) CGRect titleRect;
@property (nonatomic,assign) CGRect iconRect;

@end

@implementation SFTitleIconBtn

+ (instancetype) shareWithFrame:(CGRect)frame titleRect:(CGRect)titleRect iconRect:(CGRect)iconRect {
    return [[super alloc] initWithFrame:frame titleRect:titleRect iconRect:iconRect];
}

- (instancetype) initWithFrame:(CGRect)frame titleRect:(CGRect)titleRect iconRect:(CGRect)iconRect
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleRect = titleRect;
        self.iconRect = iconRect;
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return self.iconRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return self.titleRect;
}

@end
