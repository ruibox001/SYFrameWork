//
//  NSMutableAttributedString+SF.h
//  Tronker
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define mutableAttributeStr NSMutableAttributedString

#define mutableAttibuteString(x) [mutableAttributeStr stringToAttibuteString:x]

@interface NSMutableAttributedString (SF)

- (mutableAttributeStr *)stringToAttibuteString:(NSString *)str;

- (mutableAttributeStr *(^)(UIColor *,NSRange))colorRange;

@end
