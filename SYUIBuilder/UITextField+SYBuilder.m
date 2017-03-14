//
//  UITextField+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UITextField+SYBuilder.h"

@implementation UITextField (SYBuilder)

- (SYPropertyUITextFieldObjectBlock)strColor {
    return ^ (id color) {
        if ([color isKindOfClass:[UIColor class]]) {
            self.textColor = color;
        }
        return self;
    };
}

- (SYPropertyUITextFieldObjectBlock)delegat {
    return ^ (id delegat) {
        if (delegat) {
            self.delegate = delegat;
        }
        return self;
    };
}

- (SYPropertyUITextFieldObjectBlock)placeHoder {
    return ^ (id holderStr) {
        if ([holderStr isKindOfClass:[NSString class]]) {
            self.placeholder = holderStr;
        }
        return self;
    };
}

- (SYPropertyUITextFieldObjectBlock)leftV {
    return ^ (id leftView) {
        if ([leftView isKindOfClass:[UIView class]]) {
            self.leftView = leftView;
        }
        return self;
    };
}

- (SYPropertyUITextFieldObjectBlock)rightV {
    return ^ (id rightView) {
        if ([rightView isKindOfClass:[UIView class]]) {
            self.rightView = rightView;
        }
        return self;
    };
}


@end
