//
//  UnlockView.h
//  Unlock
//
//  Created by 王声远 on 15/5/16.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFTitleIconModel.h"

@interface SFTitleIconView : UIView

- (SFTitleIconView *(^)(NSString *, NSString *))addTitleIcon;
- (SFTitleIconView *(^)(void (^)(NSInteger index)))click;

@end
