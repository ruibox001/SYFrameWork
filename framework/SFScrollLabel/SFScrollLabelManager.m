//
//  SFScrollLabel.m
//  DDG
//
//  Created by 王声远 on 17/3/22.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SFScrollLabelManager.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;

@interface SFScrollLabelManager()

@property (nonatomic,assign,getter=isUp) BOOL up;
@property (nonatomic,assign) NSInteger scrollIndex;
@property (nonatomic,assign) UILabel *scrollLabel;
@property (nonatomic,assign) CGRect scollImageFrome;
@property (nonatomic,strong) NSArray *bannerListArray;
@property (nonatomic,assign) CGFloat animationTime;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation SFScrollLabelManager

- (instancetype) initWithLabel:(UILabel *)label array:(NSArray *)array scollTime:(CGFloat)time animationTime:(CGFloat)aTime up:(BOOL)up {
    self = [super init];
    if (self) {
        self.up = up;
        self.scrollLabel = label;
        self.scollImageFrome = label.frame;
        self.bannerListArray = array;
        self.animationTime = aTime;
        
        NSAssert(CGSizeEqualToSize(label.frame.size, label.superview.frame.size), @"滚动的label要添加到一个一摸一样大小的UIView上且它们的Size一样大小");
        
        self.scrollLabel.superview.clipsToBounds = YES;
        
        WEAKSELF
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            weakSelf.timer=[NSTimer scheduledTimerWithTimeInterval:time
                                                            target:weakSelf
                                                          selector:@selector(scollLabel)
                                                          userInfo:nil
                                                           repeats:YES] ;
            [[NSRunLoop currentRunLoop] addTimer:weakSelf.timer forMode:NSDefaultRunLoopMode];
            [[NSRunLoop currentRunLoop] run];
        });
    }
    return self;
}

- (void)scollLabel {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 生成切换视图
        UIView *snapshopView = [self customViewFromSnapshopView:self.scrollLabel];
        [self.scrollLabel.superview addSubview:snapshopView];
        [snapshopView setFrame:CGRectMake(0, 0, self.scollImageFrome.size.width, self.scollImageFrome.size.height)];
        
        // 切换新数据
        CGRect newFrame = self.scrollLabel.frame;
        newFrame.origin.y = self.isUp ? self.scrollLabel.frame.size.height : -self.scrollLabel.frame.size.height;
        self.scrollLabel.frame = newFrame;
        
        if (self.scrollIndex + 1 < self.bannerListArray.count) {
            self.scrollIndex += 1;
        } else {
            self.scrollIndex = 0;
        }
        self.scrollLabel.text = self.bannerListArray[self.scrollIndex];
        
        // 执行动画
        [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            CGRect frame = snapshopView.frame;
            frame.origin.y = self.isUp? -self.scrollLabel.frame.size.height : self.scrollLabel.frame.size.height;
            snapshopView.frame = frame;
            
            [UIView animateWithDuration:self.animationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect frame = self.scrollLabel.frame;
                frame.origin.y = 0;
                self.scrollLabel.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
            
        } completion:^(BOOL finished) {
            [snapshopView removeFromSuperview];
        }];
    });
}

- (UIView *)customViewFromSnapshopView:(UIView *)v {
    UIGraphicsBeginImageContextWithOptions(v.bounds.size, NO, 0);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.backgroundColor = [UIColor whiteColor];
    return snapshot;
}

@end
