//
//  NSString+SF.h
//  Tronker
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define mutableAttributeStr NSMutableAttributedString

@interface NSString (SF)

- (mutableAttributeStr *(^)())toAttibuteString;

- (CGSize (^)(UIFont *,CGSize))getSize;

@end
