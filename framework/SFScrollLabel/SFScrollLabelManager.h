//
//  SFScrollLabel.h
//  DDG
//
//  Created by 王声远 on 17/3/22.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SFScrollLabelManager : NSObject

- (instancetype) initWithLabel:(UILabel *)label array:(NSArray *)array scollTime:(CGFloat)time animationTime:(CGFloat)aTime up:(BOOL)up;

@end
