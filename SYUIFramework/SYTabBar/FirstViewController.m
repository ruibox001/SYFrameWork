//
//  FirstViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "FirstViewController.h"
#import "SYTabBarController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SYTabBarController *tarBar = (SYTabBarController *)self.tabBarController;
    [tarBar setTabBarItemUnReadCount:8 selectedIndex:0];
}


@end
