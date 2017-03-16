//
//  SFTitleIconModel.m
//  Tronker
//
//  Created by 王声远 on 17/3/4.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFTitleIconModel.h"

@implementation SFTitleIconModel

+ (instancetype) shareWithIcon:(NSString *)icon title:(NSString *)tile {
    return [[super alloc] initWithIcon:icon title:tile];
}

- (instancetype) initWithIcon:(NSString *)icon title:(NSString *)tile {
    self = [super init];
    if (self) {
        
        self.icon = icon;
        self.title = tile;
        
    }
    return self;
}

@end
