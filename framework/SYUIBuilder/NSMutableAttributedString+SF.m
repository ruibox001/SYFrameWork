//
//  NSMutableAttributedString+SF.m
//  Tronker
//
//  Created by 王声远 on 17/3/16.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "NSMutableAttributedString+SF.h"

#define DefaultLineSpace 8  //默认行间距

#define selfRange NSMakeRange(0, self.length)

@implementation NSMutableAttributedString (SF)

- (mutableAttributeStr *)stringToAttibuteString:(NSString *)str {
    return [[mutableAttributeStr alloc] initWithString:str];
}

- (mutableAttributeStr *(^)(UIColor *,NSRange))colorRange {
    return ^(UIColor *color,NSRange range){
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        return self;
    };
}

- (mutableAttributeStr *(^)(UIColor *))color {
    return ^(UIColor *color){
        [self addAttribute:NSForegroundColorAttributeName value:color range:selfRange];
        return self;
    };
}

- (mutableAttributeStr *(^)(UIFont *,NSRange))fontRange {
    return ^(UIFont *font,NSRange range){
        [self addAttribute:NSFontAttributeName value:font range:range];
        return self;
    };
}

- (mutableAttributeStr *(^)(UIFont *))font {
    return ^(UIFont *font){
        [self addAttribute:NSFontAttributeName value:font range:selfRange];
        return self;
    };
}

- (mutableAttributeStr *(^)(UIColor *,UIFont *,NSRange))colorFontRange {
    return ^(UIColor *color,UIFont *font,NSRange range){
        [self addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:range];
        return self;
    };
}

- (mutableAttributeStr *(^)(UIColor *,UIFont *))colorFont {
    return ^(UIColor *color,UIFont *font){
        [self addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:selfRange];
        return self;
    };
}

- (mutableAttributeStr *(^)(NSTextAlignment,CGFloat,NSRange))alignmentLineSpaceRange {
    return ^(NSTextAlignment a,CGFloat space,NSRange range){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];
        paragraphStyle.alignment = a;
        [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
        return self;
    };
}

- (mutableAttributeStr *(^)(NSTextAlignment,CGFloat))alignmentLineSpace {
    return ^(NSTextAlignment a,CGFloat space){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];
        paragraphStyle.alignment = a;
        [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (mutableAttributeStr *(^)(NSTextAlignment))alignment {
    return ^(NSTextAlignment a){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:DefaultLineSpace];
        paragraphStyle.alignment = a;
        [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (CGSize (^)(CGSize))getSize {
    return ^(CGSize size){
        CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        return rect.size;
    };
}

- (CGFloat (^)(CGFloat))getHeight {
    return ^(CGFloat width){
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        return rect.size.height;
    };
}

@end
