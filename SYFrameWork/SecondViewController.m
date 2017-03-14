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
    
    Button.nTitle(@"sds").btnFont(Fntb(@45)).xywh(100,200,200,60).bgColor(color(@"f04554,0.3")).intoView(self.view).targetSel(self,@selector(click));
    
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
