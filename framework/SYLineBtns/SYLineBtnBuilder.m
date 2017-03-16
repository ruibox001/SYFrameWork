//
//  SYLineBtnBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYLineBtnBuilder.h"

@interface SYLineBtnBuilder()

@property (strong, nonatomic) SFTitleIconView *lView;

@end

@implementation SYLineBtnBuilder


LineBtnBuilder *lBtnBuilder(){
    SYLineBtnBuilder *m = SYLineBtnBuilder.new;
    if (m) {
        m.lView = [[SFTitleIconView alloc] init];
    }
    return m.lView;
}

@end
