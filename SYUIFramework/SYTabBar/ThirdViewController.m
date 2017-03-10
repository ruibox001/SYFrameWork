//
//  ThirdViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ThirdViewController.h"
#import "SYTabBarController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SYTabBarController *tarBar = (SYTabBarController *)self.tabBarController;
    [tarBar setTabBarItemUnReadCount:0 selectedIndex:2];
}


@end
