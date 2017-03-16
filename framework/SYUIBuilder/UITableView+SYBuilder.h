//
//  UITableView+SYBuilder.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYUIBuilderDef.h"

#define TableViewPlain   [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain]
#define TableViewGroup   [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped]

@interface UITableView (SYBuilder)

SY_UITABLEVIEW_PROP(Object) delegat;

SY_UITABLEVIEW_PROP(Object) dataSouce;

SY_UITABLEVIEW_PROP(Object) headerView;

SY_UITABLEVIEW_PROP(Object) footerView;

SY_UITABLEVIEW_PROP(Bool) showsVerticalIndicator;

SY_UITABLEVIEW_PROP(Bool) showsHorizontalIndicator;

SY_UITABLEVIEW_PROP(Int) separatorStyl;

@end
