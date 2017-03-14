//
//  SecondViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SecondViewController.h"
#import "SYAlertBuilder.h"
#import "SYTabBarMaker.h"
#import "SYUIBuilderHeader.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 240, 60)];
    view.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [view addGestureRecognizer:tap];
    [self.view addSubview:view];
    
    Button.xywh(100,200,200,60).bgColor([UIColor redColor]).intoView(self.view);
    
}

- (void)click {
    //alert使用
    Sheet.title(@"这里标题").message(@"这里内容").cancelAction(@"取消",^(){
        
        [self hidenTabBar:YES];
        
    }).addAction(@"Action",^(){
        
        [self hidenTabBar:NO];
        
    }).show(self);
    
}

@end
