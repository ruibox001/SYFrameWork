//
//  STKFinancialScrollIndicator.h
//  Tronker
//
//  Created by 王声远 on 17/2/25.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STKFinancialScrollIndicator : UIView

+ (instancetype)shareWithFrame:(CGRect)frame numberOfLine:(NSInteger)numberLines lineColor:(UIColor *)color;

- (void)drawSelectLineOfNumber:(NSInteger)lineNumber;

@end
