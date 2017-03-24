//
//  SFProgressView.h
//  DDG
//
//  Created by 王声远 on 17/3/24.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFProgressView : UIView

@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,strong) id progressColors;
@property (nonatomic,assign) CGFloat cornerRadius;

@end
