//
//  ViewController.m
//  SYDemo
//
//  Created by 王声远 on 17/3/14.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ViewController.h"
#import "SYTabBarMaker.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#import "SYGuiViewBuilder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSArray *imgs = @[@"640x1136page1",@"640x1136page2",@"640x1136page3"];
    guiViewBuilder().images(imgs).btnBottonOffset(50).createBtn(@"立即体验",[UIColor redColor],[UIColor blackColor],8,CGSizeMake(100, 40),12,^(){
        NSLog(@"click");
        [self buildTabBar];
    }).addImageName(@"640x1136page2").show();
    
}


//tarBar构建
- (void)buildTabBar
{
    NSArray *normalArray = [[NSArray alloc]initWithObjects:@"icon_screening_unselect.png",@"icon_interview_unselect.png",@"icon_mine_unselect.png", nil];
    NSArray *pressArray = [[NSArray alloc]initWithObjects:@"icon_screening_select.png",@"icon_interview_select.png",@"icon_mine_select.png", nil];
    NSArray *titleArray = @[@"筛选",@"面试",@"我的"];
    NSArray *ctrsArray = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController"];
    for(int i = 0; i < titleArray.count; i ++){
        TabBar.controllerAndNavigationControllerWithInfo(ctrsArray[i],@"UINavigationController",normalArray[i],pressArray[i],titleArray[i],nil,nil);
    }
    TabBar.show();
}


@end
