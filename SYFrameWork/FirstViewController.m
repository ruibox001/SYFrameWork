//
//  FirstViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "FirstViewController.h"
#import "SYNavigationHeader.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationTitle:@"标题"];
    [self addNavigationLeft:[UIImage imageNamed:@"back_black"] clickBlock:nil];
    [self addNavigationRight:@"协议" clickBlock:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.tableFooterView = [UIView new];
}

@end
