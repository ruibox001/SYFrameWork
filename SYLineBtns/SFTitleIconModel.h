//
//  SFTitleIconModel.h
//  Tronker
//
//  Created by 王声远 on 17/3/4.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFTitleIconModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *icon;

+ (instancetype) shareWithIcon:(NSString *)icon title:(NSString *)tile;

@end
