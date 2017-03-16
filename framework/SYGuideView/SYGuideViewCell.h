//
//  SYGuideViewCell.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#define kGuideViewBounds [UIScreen mainScreen].bounds

#import <UIKit/UIKit.h>


@interface SYGuideViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *btn;

/**
 体验按钮距离底部位置
 */
@property (nonatomic,assign) CGFloat guideBtnBottonOffset;

@end
