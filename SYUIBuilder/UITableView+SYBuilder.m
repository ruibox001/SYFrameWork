//
//  UITableView+SYBuilder.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "UITableView+SYBuilder.h"

@implementation UITableView (SYBuilder)

- (SYPropertyUITableViewObjectBlock)delegat {
    return ^ (id delegat) {
        if (delegat) {
            self.delegate = delegat;
        }
        return self;
    };
}

- (SYPropertyUITableViewObjectBlock)dataSouce {
    return ^ (id dataSouce) {
        if (dataSouce) {
            self.dataSource = dataSouce;
        }
        return self;
    };
}

- (SYPropertyUITableViewObjectBlock)headerView {
    return ^ (id headerView) {
        self.tableHeaderView = headerView;
        return self;
    };
}

- (SYPropertyUITableViewObjectBlock)footerView {
    return ^ (id footerView) {
        self.tableFooterView = footerView;
        return self;
    };
}

- (SYPropertyUITableViewBoolBlock)showsVerticalIndicator {
    return ^ (BOOL show) {
        self.showsVerticalScrollIndicator = show;
        return self;
    };
}

- (SYPropertyUITableViewBoolBlock)showsHorizontalIndicator {
    return ^ (BOOL show) {
        self.showsHorizontalScrollIndicator = show;
        return self;
    };
}

- (SYPropertyUITableViewIntBlock)separatorStyl {
    return ^ (NSInteger separatorStyl) {
        self.separatorStyle = separatorStyl;
        return self;
    };
}

@end
