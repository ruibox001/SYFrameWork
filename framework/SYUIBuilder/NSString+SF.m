//
//  NSString+SF.m
//  Tronker
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "NSString+SF.h"

@implementation NSString (SF)

- (mutableAttributeStr *(^)())toAttibuteString {
    return ^(){
        return [[NSMutableAttributedString alloc] initWithString:self];
    };
}

- (CGSize (^)(UIFont *,CGSize))getSize {
    return ^(UIFont *font,CGSize size){
        NSDictionary *attrs = @{NSFontAttributeName : font};
        return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    };
}

@end
