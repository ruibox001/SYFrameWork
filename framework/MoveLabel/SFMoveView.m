//
//  SYMoveView.m
//  Simei
//
//  Created by 王声远 on 16/5/20.
//  Copyright © 2016年 创美汇. All rights reserved.
//

#import "SFMoveView.h"

@interface SFMoveView()

@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UILabel *scrollLabel;
@property (nonatomic,assign) CGFloat contentWidth;

@end

@implementation SFMoveView

+ (instancetype)startWithFrame:(CGRect)frame content:(NSString *)content textColor:(UIColor *)textColor font:(UIFont *)font{
    return [[self alloc] initWithFrame:frame content:content textColor:textColor font:font];
}

- (instancetype)initWithFrame:(CGRect)frame content:(NSString *)content textColor:(UIColor *)textColor font:(UIFont *)font
{
    self = [super initWithFrame:frame];
    if (self) {
        

        CGFloat h = frame.size.height;
        UIScrollView *scrllView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrllView];
        self.scrollView = scrllView;
        [self.scrollView setShowsHorizontalScrollIndicator:NO];
        
        UILabel *cLabel = [UILabel new];
        [cLabel setBackgroundColor:[UIColor clearColor]];
        [cLabel setTextColor:textColor];          //文字颜色
        cLabel.textAlignment = NSTextAlignmentCenter;
        cLabel.numberOfLines = 1;
        cLabel.text = content;
        cLabel.font = font;
        [self.scrollView addSubview:cLabel];
        self.scrollLabel = cLabel;
        
        NSDictionary *attrs = @{NSFontAttributeName : cLabel.font};
        CGSize s = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, h) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
        
        self.contentWidth = s.width;
        [self.scrollLabel setFrame:CGRectMake(0, 0, s.width+self.scrollView.frame.size.width, h)];
        [self.scrollView setContentSize:CGSizeMake(s.width+self.scrollView.frame.size.width, h)];
        [self.scrollView setContentOffset:CGPointMake(-self.scrollView.frame.size.width/2.0, 0)];
        
        [self startMoveLabel];
    }
    return self;
}

- (void)stopMove {
    self.scrollLabel.hidden = YES;
    [self removeFromSuperview];
}

- (void)startMoveLabel {
    [UIView animateWithDuration:self.scrollLabel.text.length/2.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.scrollView setContentOffset:CGPointMake(self.contentWidth+self.scrollView.frame.size.width/2.0, 0)];
    } completion:^(BOOL finished) {
        if (finished) {
            [self.scrollView setContentOffset:CGPointMake(-self.scrollView.frame.size.width/2.0, 0)];
            [self startMoveLabel];
        }
    }];
}



@end
